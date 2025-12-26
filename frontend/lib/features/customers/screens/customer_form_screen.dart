import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/app_colors.dart';
import '../../../data/models/customer_model.dart';
import '../../../data/repositories/customer_repository.dart';
import '../../../data/providers/repository_providers.dart';

class CustomerFormScreen extends ConsumerStatefulWidget {
  final String? customerId;
  final CustomerModel? customer;

  const CustomerFormScreen({
    super.key,
    this.customerId,
    this.customer,
  });

  @override
  ConsumerState<CustomerFormScreen> createState() => _CustomerFormScreenState();
}

class _CustomerFormScreenState extends ConsumerState<CustomerFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _companyController = TextEditingController();
  final _notesController = TextEditingController();

  // Billing address
  final _billingAddressController = TextEditingController();
  final _billingCityController = TextEditingController();
  final _billingStateController = TextEditingController();
  final _billingPostalCodeController = TextEditingController();
  final _billingCountryController = TextEditingController();

  // Shipping address
  final _shippingAddressController = TextEditingController();
  final _shippingCityController = TextEditingController();
  final _shippingStateController = TextEditingController();
  final _shippingPostalCodeController = TextEditingController();
  final _shippingCountryController = TextEditingController();

  String _customerType = 'individual';
  String _status = 'active';
  bool _isLoading = false;
  bool _sameAsBilling = false;

  @override
  void initState() {
    super.initState();
    if (widget.customer != null) {
      _populateForm(widget.customer!);
    }
  }

  void _populateForm(CustomerModel customer) {
    _firstNameController.text = customer.firstName;
    _lastNameController.text = customer.lastName;
    _emailController.text = customer.email;
    _phoneController.text = customer.phone ?? '';
    _companyController.text = customer.company ?? '';
    _notesController.text = customer.notes ?? '';
    _customerType = customer.customerType ?? 'individual';
    _status = customer.status ?? 'active';

    // Billing
    _billingAddressController.text = customer.billingAddress ?? '';
    _billingCityController.text = customer.billingCity ?? '';
    _billingStateController.text = customer.billingState ?? '';
    _billingPostalCodeController.text = customer.billingPostalCode ?? '';
    _billingCountryController.text = customer.billingCountry ?? '';

    // Shipping
    _shippingAddressController.text = customer.shippingAddress ?? '';
    _shippingCityController.text = customer.shippingCity ?? '';
    _shippingStateController.text = customer.shippingState ?? '';
    _shippingPostalCodeController.text = customer.shippingPostalCode ?? '';
    _shippingCountryController.text = customer.shippingCountry ?? '';
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _companyController.dispose();
    _notesController.dispose();
    _billingAddressController.dispose();
    _billingCityController.dispose();
    _billingStateController.dispose();
    _billingPostalCodeController.dispose();
    _billingCountryController.dispose();
    _shippingAddressController.dispose();
    _shippingCityController.dispose();
    _shippingStateController.dispose();
    _shippingPostalCodeController.dispose();
    _shippingCountryController.dispose();
    super.dispose();
  }

  void _copuBillingToShipping() {
    if (_sameAsBilling) {
      _shippingAddressController.text = _billingAddressController.text;
      _shippingCityController.text = _billingCityController.text;
      _shippingStateController.text = _billingStateController.text;
      _shippingPostalCodeController.text = _billingPostalCodeController.text;
      _shippingCountryController.text = _billingCountryController.text;
    }
  }

  Future<void> _saveCustomer() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    try {
      final repository = ref.read(customerRepositoryProvider);

      if (widget.customer == null) {
        // Create new customer
        final request = CreateCustomerRequest(
          firstName: _firstNameController.text.trim(),
          lastName: _lastNameController.text.trim(),
          email: _emailController.text.trim(),
          phone: _phoneController.text.trim().isEmpty ? null : _phoneController.text.trim(),
          company: _companyController.text.trim().isEmpty ? null : _companyController.text.trim(),
          customerType: _customerType,
          status: _status,
          billingAddress: _billingAddressController.text.trim().isEmpty ? null : _billingAddressController.text.trim(),
          billingCity: _billingCityController.text.trim().isEmpty ? null : _billingCityController.text.trim(),
          billingState: _billingStateController.text.trim().isEmpty ? null : _billingStateController.text.trim(),
          billingPostalCode: _billingPostalCodeController.text.trim().isEmpty ? null : _billingPostalCodeController.text.trim(),
          billingCountry: _billingCountryController.text.trim().isEmpty ? null : _billingCountryController.text.trim(),
          shippingAddress: _shippingAddressController.text.trim().isEmpty ? null : _shippingAddressController.text.trim(),
          shippingCity: _shippingCityController.text.trim().isEmpty ? null : _shippingCityController.text.trim(),
          shippingState: _shippingStateController.text.trim().isEmpty ? null : _shippingStateController.text.trim(),
          shippingPostalCode: _shippingPostalCodeController.text.trim().isEmpty ? null : _shippingPostalCodeController.text.trim(),
          shippingCountry: _shippingCountryController.text.trim().isEmpty ? null : _shippingCountryController.text.trim(),
          notes: _notesController.text.trim().isEmpty ? null : _notesController.text.trim(),
        );

        await repository.createCustomer(request);

        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Customer created successfully')),
          );
          context.pop();
        }
      } else {
        // Update existing customer
        final request = UpdateCustomerRequest(
          firstName: _firstNameController.text.trim() != widget.customer!.firstName
              ? _firstNameController.text.trim()
              : null,
          lastName: _lastNameController.text.trim() != widget.customer!.lastName
              ? _lastNameController.text.trim()
              : null,
          email: _emailController.text.trim() != widget.customer!.email
              ? _emailController.text.trim()
              : null,
          phone: _phoneController.text.trim() != (widget.customer!.phone ?? '')
              ? (_phoneController.text.trim().isEmpty ? null : _phoneController.text.trim())
              : null,
          company: _companyController.text.trim() != (widget.customer!.company ?? '')
              ? (_companyController.text.trim().isEmpty ? null : _companyController.text.trim())
              : null,
          customerType: _customerType != widget.customer!.customerType ? _customerType : null,
          status: _status != widget.customer!.status ? _status : null,
          billingAddress: _billingAddressController.text.trim() != (widget.customer!.billingAddress ?? '')
              ? (_billingAddressController.text.trim().isEmpty ? null : _billingAddressController.text.trim())
              : null,
          billingCity: _billingCityController.text.trim() != (widget.customer!.billingCity ?? '')
              ? (_billingCityController.text.trim().isEmpty ? null : _billingCityController.text.trim())
              : null,
          billingState: _billingStateController.text.trim() != (widget.customer!.billingState ?? '')
              ? (_billingStateController.text.trim().isEmpty ? null : _billingStateController.text.trim())
              : null,
          billingPostalCode: _billingPostalCodeController.text.trim() != (widget.customer!.billingPostalCode ?? '')
              ? (_billingPostalCodeController.text.trim().isEmpty ? null : _billingPostalCodeController.text.trim())
              : null,
          billingCountry: _billingCountryController.text.trim() != (widget.customer!.billingCountry ?? '')
              ? (_billingCountryController.text.trim().isEmpty ? null : _billingCountryController.text.trim())
              : null,
          shippingAddress: _shippingAddressController.text.trim() != (widget.customer!.shippingAddress ?? '')
              ? (_shippingAddressController.text.trim().isEmpty ? null : _shippingAddressController.text.trim())
              : null,
          shippingCity: _shippingCityController.text.trim() != (widget.customer!.shippingCity ?? '')
              ? (_shippingCityController.text.trim().isEmpty ? null : _shippingCityController.text.trim())
              : null,
          shippingState: _shippingStateController.text.trim() != (widget.customer!.shippingState ?? '')
              ? (_shippingStateController.text.trim().isEmpty ? null : _shippingStateController.text.trim())
              : null,
          shippingPostalCode: _shippingPostalCodeController.text.trim() != (widget.customer!.shippingPostalCode ?? '')
              ? (_shippingPostalCodeController.text.trim().isEmpty ? null : _shippingPostalCodeController.text.trim())
              : null,
          shippingCountry: _shippingCountryController.text.trim() != (widget.customer!.shippingCountry ?? '')
              ? (_shippingCountryController.text.trim().isEmpty ? null : _shippingCountryController.text.trim())
              : null,
          notes: _notesController.text.trim() != (widget.customer!.notes ?? '')
              ? (_notesController.text.trim().isEmpty ? null : _notesController.text.trim())
              : null,
        );

        await repository.updateCustomer(widget.customer!.id, request);

        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Customer updated successfully')),
          );
          context.pop();
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error: ${e.toString()}'),
            backgroundColor: AppColors.error,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final isEditMode = widget.customer != null;

    return Scaffold(
      appBar: AppBar(
        title: Text(isEditMode ? 'Edit Customer' : 'New Customer'),
        actions: [
          if (_isLoading)
            const Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
              ),
            )
          else
            IconButton(
              icon: const Icon(Icons.check_rounded),
              onPressed: _saveCustomer,
            ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // Basic Information
            Text(
              'Basic Information',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 16),

            TextFormField(
              controller: _firstNameController,
              decoration: const InputDecoration(
                labelText: 'First Name *',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'First name is required';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),

            TextFormField(
              controller: _lastNameController,
              decoration: const InputDecoration(
                labelText: 'Last Name *',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Last name is required';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),

            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email *',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Email is required';
                }
                if (!value.contains('@')) {
                  return 'Please enter a valid email';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),

            TextFormField(
              controller: _phoneController,
              decoration: const InputDecoration(
                labelText: 'Phone',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 16),

            TextFormField(
              controller: _companyController,
              decoration: const InputDecoration(
                labelText: 'Company',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),

            DropdownButtonFormField<String>(
              value: _customerType,
              decoration: const InputDecoration(
                labelText: 'Customer Type',
                border: OutlineInputBorder(),
              ),
              items: const [
                DropdownMenuItem(value: 'individual', child: Text('Individual')),
                DropdownMenuItem(value: 'business', child: Text('Business')),
              ],
              onChanged: (value) {
                if (value != null) {
                  setState(() => _customerType = value);
                }
              },
            ),
            const SizedBox(height: 16),

            DropdownButtonFormField<String>(
              value: _status,
              decoration: const InputDecoration(
                labelText: 'Status',
                border: OutlineInputBorder(),
              ),
              items: const [
                DropdownMenuItem(value: 'active', child: Text('Active')),
                DropdownMenuItem(value: 'inactive', child: Text('Inactive')),
              ],
              onChanged: (value) {
                if (value != null) {
                  setState(() => _status = value);
                }
              },
            ),
            const SizedBox(height: 24),

            // Billing Address
            Text(
              'Billing Address',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 16),

            TextFormField(
              controller: _billingAddressController,
              decoration: const InputDecoration(
                labelText: 'Street Address',
                border: OutlineInputBorder(),
              ),
              maxLines: 2,
            ),
            const SizedBox(height: 16),

            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _billingCityController,
                    decoration: const InputDecoration(
                      labelText: 'City',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: TextFormField(
                    controller: _billingStateController,
                    decoration: const InputDecoration(
                      labelText: 'State',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _billingPostalCodeController,
                    decoration: const InputDecoration(
                      labelText: 'Postal Code',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: TextFormField(
                    controller: _billingCountryController,
                    decoration: const InputDecoration(
                      labelText: 'Country',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Shipping Address
            Row(
              children: [
                Text(
                  'Shipping Address',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const Spacer(),
                Row(
                  children: [
                    Checkbox(
                      value: _sameAsBilling,
                      onChanged: (value) {
                        setState(() {
                          _sameAsBilling = value ?? false;
                          if (_sameAsBilling) {
                            _copuBillingToShipping();
                          }
                        });
                      },
                    ),
                    const Text('Same as billing'),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),

            TextFormField(
              controller: _shippingAddressController,
              decoration: const InputDecoration(
                labelText: 'Street Address',
                border: OutlineInputBorder(),
              ),
              maxLines: 2,
              enabled: !_sameAsBilling,
            ),
            const SizedBox(height: 16),

            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _shippingCityController,
                    decoration: const InputDecoration(
                      labelText: 'City',
                      border: OutlineInputBorder(),
                    ),
                    enabled: !_sameAsBilling,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: TextFormField(
                    controller: _shippingStateController,
                    decoration: const InputDecoration(
                      labelText: 'State',
                      border: OutlineInputBorder(),
                    ),
                    enabled: !_sameAsBilling,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _shippingPostalCodeController,
                    decoration: const InputDecoration(
                      labelText: 'Postal Code',
                      border: OutlineInputBorder(),
                    ),
                    enabled: !_sameAsBilling,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: TextFormField(
                    controller: _shippingCountryController,
                    decoration: const InputDecoration(
                      labelText: 'Country',
                      border: OutlineInputBorder(),
                    ),
                    enabled: !_sameAsBilling,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Notes
            Text(
              'Notes',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 16),

            TextFormField(
              controller: _notesController,
              decoration: const InputDecoration(
                labelText: 'Internal Notes',
                border: OutlineInputBorder(),
                hintText: 'Add any additional notes about this customer',
              ),
              maxLines: 4,
            ),
            const SizedBox(height: 24),

            // Save Button
            SizedBox(
              height: 48,
              child: ElevatedButton(
                onPressed: _isLoading ? null : _saveCustomer,
                child: _isLoading
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : Text(isEditMode ? 'Update Customer' : 'Create Customer'),
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
