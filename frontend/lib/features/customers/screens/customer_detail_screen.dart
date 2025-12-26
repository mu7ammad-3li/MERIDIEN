import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import '../../../core/constants/app_colors.dart';
import '../../../data/models/customer_model.dart';
import '../../../data/repositories/customer_repository.dart';
import '../../../data/providers/repository_providers.dart';
import '../providers/customer_provider.dart';

class CustomerDetailScreen extends ConsumerStatefulWidget {
  final String customerId;

  const CustomerDetailScreen({
    super.key,
    required this.customerId,
  });

  @override
  ConsumerState<CustomerDetailScreen> createState() =>
      _CustomerDetailScreenState();
}

class _CustomerDetailScreenState extends ConsumerState<CustomerDetailScreen> {
  CustomerModel? _customer;
  bool _isLoading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _loadCustomer();
  }

  Future<void> _loadCustomer() async {
    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      final repository = ref.read(customerRepositoryProvider);
      final customer = await repository.getCustomerById(widget.customerId);

      if (mounted) {
        setState(() {
          _customer = customer;
          _isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _error = e.toString();
          _isLoading = false;
        });
      }
    }
  }

  Future<void> _deleteCustomer() async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Customer'),
        content: const Text(
          'Are you sure you want to delete this customer? This action cannot be undone.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context, true),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.error,
              foregroundColor: Colors.white,
            ),
            child: const Text('Delete'),
          ),
        ],
      ),
    );

    if (confirm == true) {
      try {
        final repository = ref.read(customerRepositoryProvider);
        await repository.deleteCustomer(widget.customerId);

        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Customer deleted successfully')),
          );
          // Refresh the customer list
          ref.read(customerListProvider.notifier).refresh();
          context.pop();
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Error deleting customer: ${e.toString()}'),
              backgroundColor: AppColors.error,
            ),
          );
        }
      }
    }
  }

  void _editCustomer() {
    if (_customer != null) {
      context.push('/customers/${widget.customerId}/edit', extra: _customer);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return Scaffold(
        appBar: AppBar(title: const Text('Customer Details')),
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    if (_error != null || _customer == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Customer Details')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.error_outline_rounded,
                size: 64,
                color: AppColors.error,
              ),
              const SizedBox(height: 16),
              Text(
                'Error loading customer',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Text(
                  _error ?? 'Customer not found',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppColors.textSecondary,
                      ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _loadCustomer,
                child: const Text('Retry'),
              ),
            ],
          ),
        ),
      );
    }

    final customer = _customer!;
    final dateFormat = DateFormat('MMM dd, yyyy');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Customer Details'),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit_rounded),
            onPressed: _editCustomer,
          ),
          IconButton(
            icon: const Icon(Icons.delete_rounded),
            onPressed: _deleteCustomer,
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: _loadCustomer,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // Header Card
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 32,
                          backgroundColor: AppColors.primary.withOpacity(0.1),
                          child: Text(
                            '${customer.firstName[0]}${customer.lastName[0]}'.toUpperCase(),
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primary,
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                customer.displayName,
                                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                customer.email,
                                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                      color: AppColors.textSecondary,
                                    ),
                              ),
                              if (customer.phone != null && customer.phone!.isNotEmpty) ...[
                                const SizedBox(height: 4),
                                Text(
                                  customer.phone!,
                                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                        color: AppColors.textSecondary,
                                      ),
                                ),
                              ],
                            ],
                          ),
                        ),
                        _StatusChip(status: customer.status ?? 'active'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Basic Information
            _SectionCard(
              title: 'Basic Information',
              children: [
                _InfoRow(label: 'First Name', value: customer.firstName),
                const Divider(),
                _InfoRow(label: 'Last Name', value: customer.lastName),
                const Divider(),
                _InfoRow(label: 'Email', value: customer.email),
                if (customer.phone != null && customer.phone!.isNotEmpty) ...[
                  const Divider(),
                  _InfoRow(label: 'Phone', value: customer.phone!),
                ],
                if (customer.company != null && customer.company!.isNotEmpty) ...[
                  const Divider(),
                  _InfoRow(label: 'Company', value: customer.company!),
                ],
                const Divider(),
                _InfoRow(
                  label: 'Customer Type',
                  value: customer.customerType ?? 'individual',
                ),
                const Divider(),
                _InfoRow(
                  label: 'Created',
                  value: customer.createdAt != null
                      ? dateFormat.format(customer.createdAt!)
                      : 'N/A',
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Billing Address
            if (customer.billingAddress != null ||
                customer.billingCity != null ||
                customer.billingState != null)
              _SectionCard(
                title: 'Billing Address',
                children: [
                  _InfoRow(
                    label: 'Address',
                    value: customer.billingAddressFull.isEmpty
                        ? 'No billing address'
                        : customer.billingAddressFull,
                  ),
                ],
              ),
            const SizedBox(height: 16),

            // Shipping Address
            if (customer.shippingAddress != null ||
                customer.shippingCity != null ||
                customer.shippingState != null)
              _SectionCard(
                title: 'Shipping Address',
                children: [
                  _InfoRow(
                    label: 'Address',
                    value: customer.shippingAddressFull.isEmpty
                        ? 'No shipping address'
                        : customer.shippingAddressFull,
                  ),
                ],
              ),
            const SizedBox(height: 16),

            // Notes
            if (customer.notes != null && customer.notes!.isNotEmpty)
              _SectionCard(
                title: 'Notes',
                children: [
                  Text(
                    customer.notes!,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}

class _SectionCard extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const _SectionCard({
    required this.title,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 16),
            ...children,
          ],
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String label;
  final String value;

  const _InfoRow({
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              label,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColors.textSecondary,
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ],
      ),
    );
  }
}

class _StatusChip extends StatelessWidget {
  final String status;

  const _StatusChip({required this.status});

  @override
  Widget build(BuildContext context) {
    final color = status == 'active' ? Colors.green : Colors.grey;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Text(
        status.toUpperCase(),
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: color,
        ),
      ),
    );
  }
}
