/// App-wide string constants for MERIDIEN
class AppStrings {
  AppStrings._();

  // App Info
  static const String appName = 'MERIDIEN';
  static const String appFullName =
      'Multi-tenant Enterprise Retail & Inventory Digital Intelligence Engine';
  static const String appVersion = '1.0.0';

  // Authentication
  static const String login = 'Login';
  static const String register = 'Register';
  static const String logout = 'Logout';
  static const String email = 'Email';
  static const String password = 'Password';
  static const String confirmPassword = 'Confirm Password';
  static const String firstName = 'First Name';
  static const String lastName = 'Last Name';
  static const String tenantSlug = 'Tenant';
  static const String forgotPassword = 'Forgot Password?';
  static const String dontHaveAccount = "Don't have an account?";
  static const String alreadyHaveAccount = 'Already have an account?';
  static const String signIn = 'Sign In';
  static const String signUp = 'Sign Up';
  static const String welcome = 'Welcome';
  static const String welcomeBack = 'Welcome Back';

  // Dashboard
  static const String dashboard = 'Dashboard';
  static const String overview = 'Overview';
  static const String quickActions = 'Quick Actions';
  static const String recentOrders = 'Recent Orders';
  static const String lowStockAlerts = 'Low Stock Alerts';
  static const String totalRevenue = 'Total Revenue';
  static const String totalOrders = 'Total Orders';
  static const String totalCustomers = 'Total Customers';
  static const String totalProducts = 'Total Products';

  // Customers
  static const String customers = 'Customers';
  static const String customer = 'Customer';
  static const String addCustomer = 'Add Customer';
  static const String editCustomer = 'Edit Customer';
  static const String deleteCustomer = 'Delete Customer';
  static const String customerDetails = 'Customer Details';
  static const String individual = 'Individual';
  static const String business = 'Business';
  static const String active = 'Active';
  static const String inactive = 'Inactive';
  static const String phone = 'Phone';
  static const String address = 'Address';
  static const String city = 'City';
  static const String state = 'State';
  static const String postalCode = 'Postal Code';
  static const String country = 'Country';
  static const String companyName = 'Company Name';
  static const String taxId = 'Tax ID';
  static const String creditLimit = 'Credit Limit';

  // Products
  static const String products = 'Products';
  static const String product = 'Product';
  static const String addProduct = 'Add Product';
  static const String editProduct = 'Edit Product';
  static const String deleteProduct = 'Delete Product';
  static const String productDetails = 'Product Details';
  static const String category = 'Category';
  static const String sku = 'SKU';
  static const String barcode = 'Barcode';
  static const String price = 'Price';
  static const String costPrice = 'Cost Price';
  static const String sellingPrice = 'Selling Price';
  static const String discountPrice = 'Discount Price';
  static const String stock = 'Stock';
  static const String inStock = 'In Stock';
  static const String lowStock = 'Low Stock';
  static const String outOfStock = 'Out of Stock';
  static const String featured = 'Featured';

  // Orders
  static const String orders = 'Orders';
  static const String order = 'Order';
  static const String createOrder = 'Create Order';
  static const String orderDetails = 'Order Details';
  static const String orderNumber = 'Order Number';
  static const String orderDate = 'Order Date';
  static const String orderStatus = 'Order Status';
  static const String paymentStatus = 'Payment Status';
  static const String items = 'Items';
  static const String quantity = 'Quantity';
  static const String subtotal = 'Subtotal';
  static const String tax = 'Tax';
  static const String discount = 'Discount';
  static const String shipping = 'Shipping';
  static const String total = 'Total';
  static const String paid = 'Paid';
  static const String balance = 'Balance';
  static const String recordPayment = 'Record Payment';
  static const String confirmOrder = 'Confirm Order';
  static const String shipOrder = 'Ship Order';
  static const String deliverOrder = 'Deliver Order';
  static const String cancelOrder = 'Cancel Order';

  // Order Statuses
  static const String draft = 'Draft';
  static const String pending = 'Pending';
  static const String confirmed = 'Confirmed';
  static const String processing = 'Processing';
  static const String shipped = 'Shipped';
  static const String delivered = 'Delivered';
  static const String cancelled = 'Cancelled';

  // Payment Statuses
  static const String unpaid = 'Unpaid';
  static const String partial = 'Partial';
  static const String paymentPaid = 'Paid';
  static const String refunded = 'Refunded';

  // Common Actions
  static const String save = 'Save';
  static const String cancel = 'Cancel';
  static const String delete = 'Delete';
  static const String edit = 'Edit';
  static const String add = 'Add';
  static const String search = 'Search';
  static const String filter = 'Filter';
  static const String sort = 'Sort';
  static const String refresh = 'Refresh';
  static const String submit = 'Submit';
  static const String confirm = 'Confirm';
  static const String yes = 'Yes';
  static const String no = 'No';
  static const String ok = 'OK';
  static const String close = 'Close';
  static const String viewDetails = 'View Details';

  // Messages
  static const String loading = 'Loading...';
  static const String noDataFound = 'No data found';
  static const String somethingWentWrong = 'Something went wrong';
  static const String tryAgain = 'Try Again';
  static const String success = 'Success';
  static const String error = 'Error';
  static const String warning = 'Warning';
  static const String info = 'Info';
  static const String deleteConfirmation = 'Are you sure you want to delete?';
  static const String unsavedChanges = 'You have unsaved changes';

  // Validation
  static const String fieldRequired = 'This field is required';
  static const String invalidEmail = 'Please enter a valid email';
  static const String passwordTooShort = 'Password must be at least 8 characters';
  static const String passwordMismatch = 'Passwords do not match';
  static const String invalidNumber = 'Please enter a valid number';
}
