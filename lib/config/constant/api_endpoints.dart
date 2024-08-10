class ApiEndpoints {
  ApiEndpoints._();

  static const Duration connectionTimeout = Duration(seconds: 1);
  static const Duration receiveTimeout = Duration(seconds: 1);

  static const String baseUrl = 'http://10.0.2.2:5000/api/';
  static const String base2Url =
      'http://10.0.2.2:5000/api/product/get_products';

  //Auth Routes
  static const String login = "user/login";
  static const String register = "user/create";

  static const String product = "product/get_products";


 // Cart Routes
  static const String getCart = "cart/get_cart";
  static const String addToCart = "cart/add";
  static const String updateCart = "cart/update";
  static const String deleteFromCart = "cart/delete";
  static const String clearCart = "cart/clear";

  // Order Routes
  static const String createOrder = "order/create";
  static const String getUserOrders = "order/user";

  static const limitPage = 10;
}
