import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/app_colors.dart';
import '../../../data/models/order_model.dart';
import '../../customers/providers/customer_provider.dart';
import '../../products/providers/product_provider.dart';
import '../providers/order_provider.dart';

class CreateOrderScreen extends ConsumerStatefulWidget {
  const CreateOrderScreen({super.key});

  @override
  ConsumerState<CreateOrderScreen> createState() => _CreateOrderScreenState();
}

class _CreateOrderScreenState extends ConsumerState<CreateOrderScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _selectedCustomerId;
  final List<OrderItemData> _items = [];
  bool _isSubmitting = false;

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(customerListProvider.notifier).loadCustomers();
      ref.read(productListProvider.notifier).loadProducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    final customerState = ref.watch(customerListProvider);
    final productState = ref.watch(productListProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Order'),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Customer Selection
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Customer',
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      const SizedBox(height: 16),
                      customerState.when(
                        initial: () => const CircularProgressIndicator(),
                        loading: () => const CircularProgressIndicator(),
                        loaded: (customers, _, __, ___) {
                          if (customers.isEmpty) {
                            return const Text('No customers available');
                          }
                          return DropdownButtonFormField<String>(
                            value: _selectedCustomerId,
                            decoration: const InputDecoration(
                              labelText: 'Select Customer *',
                              border: OutlineInputBorder(),
                            ),
                            items: customers.map((customer) {
                              return DropdownMenuItem(
                                value: customer.id,
                                child: Text(customer.fullName),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() => _selectedCustomerId = value);
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please select a customer';
                              }
                              return null;
                            },
                          );
                        },
                        error: (message) => Text(
                          'Error loading customers: $message',
                          style: TextStyle(color: AppColors.error),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Order Items
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Order Items',
                            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          IconButton(
                            onPressed: () => _showAddItemDialog(context, productState),
                            icon: const Icon(Icons.add_circle_outline_rounded),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      if (_items.isEmpty)
                        Text(
                          'No items added. Tap + to add items.',
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                color: AppColors.textSecondary,
                              ),
                        )
                      else
                        ..._items.asMap().entries.map((entry) {
                          final index = entry.key;
                          final item = entry.value;
                          return _buildOrderItem(index, item);
                        }),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Order Summary
              if (_items.isNotEmpty)
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Order Summary',
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        const SizedBox(height: 16),
                        _buildSummaryRow('Subtotal', _calculateSubtotal()),
                        const SizedBox(height: 8),
                        _buildSummaryRow('Tax (10%)', _calculateTax()),
                        const Divider(height: 24),
                        _buildSummaryRow('Total', _calculateTotal(), isTotal: true),
                      ],
                    ),
                  ),
                ),
              const SizedBox(height: 24),

              // Submit Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _isSubmitting || _items.isEmpty
                      ? null
                      : _submitOrder,
                  child: _isSubmitting
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : const Text('Create Order'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOrderItem(int index, OrderItemData item) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.backgroundLight,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.productName,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                ),
                const SizedBox(height: 4),
                Text(
                  '${item.quantity} × \$${item.unitPrice}',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
          Text(
            '\$${(item.quantity * double.parse(item.unitPrice)).toStringAsFixed(2)}',
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          IconButton(
            onPressed: () {
              setState(() => _items.removeAt(index));
            },
            icon: Icon(Icons.delete_outline_rounded, color: AppColors.error),
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryRow(String label, String value, {bool isTotal = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
              ),
        ),
        Text(
          value,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: isTotal ? FontWeight.bold : FontWeight.w600,
                color: isTotal ? AppColors.primary : null,
              ),
        ),
      ],
    );
  }

  String _calculateSubtotal() {
    final subtotal = _items.fold<double>(
      0,
      (sum, item) => sum + (item.quantity * double.parse(item.unitPrice)),
    );
    return subtotal.toStringAsFixed(2);
  }

  String _calculateTax() {
    final subtotal = double.parse(_calculateSubtotal());
    return (subtotal * 0.1).toStringAsFixed(2);
  }

  String _calculateTotal() {
    final subtotal = double.parse(_calculateSubtotal());
    final tax = double.parse(_calculateTax());
    return (subtotal + tax).toStringAsFixed(2);
  }

  void _showAddItemDialog(BuildContext context, dynamic productState) {
    productState.when(
      initial: () {},
      loading: () {},
      loaded: (products, _, __, ___) {
        if (products.isEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('No products available')),
          );
          return;
        }

        String? selectedProductId;
        int quantity = 1;

        showDialog(
          context: context,
          builder: (dialogContext) => StatefulBuilder(
            builder: (context, setDialogState) => AlertDialog(
              title: const Text('Add Item'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  DropdownButtonFormField<String>(
                    value: selectedProductId,
                    decoration: const InputDecoration(
                      labelText: 'Product',
                      border: OutlineInputBorder(),
                    ),
                    items: products.map((product) {
                      return DropdownMenuItem(
                        value: product.id,
                        child: Text('${product.name} (\$${product.unitPrice})'),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setDialogState(() => selectedProductId = value);
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    initialValue: quantity.toString(),
                    decoration: const InputDecoration(
                      labelText: 'Quantity',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      quantity = int.tryParse(value) ?? 1;
                    },
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(dialogContext),
                  child: const Text('Cancel'),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (selectedProductId != null) {
                      final product = products.firstWhere(
                        (p) => p.id == selectedProductId,
                      );
                      setState(() {
                        _items.add(OrderItemData(
                          productId: product.id,
                          productName: product.name,
                          quantity: quantity,
                          unitPrice: product.unitPrice,
                        ));
                      });
                      Navigator.pop(dialogContext);
                    }
                  },
                  child: const Text('Add'),
                ),
              ],
            ),
          ),
        );
      },
      error: (_) {},
    );
  }

  Future<void> _submitOrder() async {
    if (!_formKey.currentState!.validate()) return;
    if (_selectedCustomerId == null) return;
    if (_items.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please add at least one item')),
      );
      return;
    }

    setState(() => _isSubmitting = true);

    final subtotal = _calculateSubtotal();
    final tax = _calculateTax();

    final request = CreateOrderRequest(
      customerId: _selectedCustomerId!,
      status: 'draft',
      orderDate: DateTime.now(),
      items: _items.map((item) {
        return CreateOrderItemRequest(
          productId: item.productId,
          quantity: item.quantity,
          unitPrice: item.unitPrice,
        );
      }).toList(),
    );

    final result = await ref.read(orderDetailProvider.notifier).createOrder(request);

    setState(() => _isSubmitting = false);

    if (result != null && mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Order created successfully')),
      );
      context.go('/orders/${result.id}');
    }
  }
}

class OrderItemData {
  final String productId;
  final String productName;
  final int quantity;
  final String unitPrice;

  OrderItemData({
    required this.productId,
    required this.productName,
    required this.quantity,
    required this.unitPrice,
  });
}
