import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../features/auth/screens/login_screen.dart';
import '../features/auth/screens/register_screen.dart';
import '../features/dashboard/screens/dashboard_screen.dart';
import '../features/customers/screens/customer_list_screen.dart';
import '../features/customers/screens/customer_detail_screen.dart';
import '../features/customers/screens/customer_form_screen.dart';
import '../features/products/screens/product_list_screen.dart';
import '../features/products/screens/product_detail_screen.dart';
import '../features/products/screens/product_form_screen.dart';
import '../features/orders/screens/order_list_screen.dart';
import '../features/orders/screens/order_detail_screen.dart';
import '../features/orders/screens/create_order_screen.dart';
import '../features/auth/providers/auth_provider.dart';
import '../data/models/customer_model.dart';
import '../data/models/product_model.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authProvider);

  return GoRouter(
    initialLocation: '/login',
    redirect: (context, state) {
      final isAuthenticated = authState.maybeWhen(
        authenticated: (_, __) => true,
        orElse: () => false,
      );
      final isAuthRoute = state.matchedLocation == '/login' ||
                          state.matchedLocation == '/register';

      // If not authenticated and trying to access protected route, redirect to login
      if (!isAuthenticated && !isAuthRoute) {
        return '/login';
      }

      // If authenticated and trying to access auth routes, redirect to dashboard
      if (isAuthenticated && isAuthRoute) {
        return '/dashboard';
      }

      // No redirect needed
      return null;
    },
    routes: [
      GoRoute(
        path: '/login',
        name: 'login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/register',
        name: 'register',
        builder: (context, state) => const RegisterScreen(),
      ),
      GoRoute(
        path: '/dashboard',
        name: 'dashboard',
        builder: (context, state) => const DashboardScreen(),
      ),
      GoRoute(
        path: '/customers',
        name: 'customers',
        builder: (context, state) => const CustomerListScreen(),
      ),
      GoRoute(
        path: '/customers/new',
        name: 'create-customer',
        builder: (context, state) => const CustomerFormScreen(),
      ),
      GoRoute(
        path: '/customers/:id',
        name: 'customer-detail',
        builder: (context, state) {
          final id = state.pathParameters['id']!;
          return CustomerDetailScreen(customerId: id);
        },
      ),
      GoRoute(
        path: '/customers/:id/edit',
        name: 'edit-customer',
        builder: (context, state) {
          final id = state.pathParameters['id']!;
          final customer = state.extra as CustomerModel?;
          return CustomerFormScreen(
            customerId: id,
            customer: customer,
          );
        },
      ),
      GoRoute(
        path: '/products',
        name: 'products',
        builder: (context, state) => const ProductListScreen(),
      ),
      GoRoute(
        path: '/products/new',
        name: 'create-product',
        builder: (context, state) => const ProductFormScreen(),
      ),
      GoRoute(
        path: '/products/:id',
        name: 'product-detail',
        builder: (context, state) {
          final id = state.pathParameters['id']!;
          return ProductDetailScreen(productId: id);
        },
      ),
      GoRoute(
        path: '/products/:id/edit',
        name: 'edit-product',
        builder: (context, state) {
          final id = state.pathParameters['id']!;
          final product = state.extra as ProductModel?;
          return ProductFormScreen(
            productId: id,
            product: product,
          );
        },
      ),
      GoRoute(
        path: '/orders',
        name: 'orders',
        builder: (context, state) => const OrderListScreen(),
      ),
      GoRoute(
        path: '/orders/new',
        name: 'create-order',
        builder: (context, state) => const CreateOrderScreen(),
      ),
      GoRoute(
        path: '/orders/:id',
        name: 'order-detail',
        builder: (context, state) {
          final id = state.pathParameters['id']!;
          return OrderDetailScreen(orderId: id);
        },
      ),
    ],
    errorBuilder: (context, state) => Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.error_outline_rounded,
              size: 64,
              color: Colors.red,
            ),
            const SizedBox(height: 16),
            Text(
              '404 - Page Not Found',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () => context.go('/dashboard'),
              child: const Text('Go to Dashboard'),
            ),
          ],
        ),
      ),
    ),
  );
});
