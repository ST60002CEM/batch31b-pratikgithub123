class ApiEndpoints {
  ApiEndpoints._();

  static const Duration connectionTimeout = Duration(seconds: 1000);
  static const Duration receiveTimeout = Duration(seconds: 1000);

  static const String baseUrl = 'http://10.0.2.2:5000/api/user';
  static const String base2Url =
      'http://10.0.2.2:5000/api/product/get_products';

  //Auth Routes
  static const String login = "/login";
  static const String register = "/create";

  static const String product = "/get_products";

  static const limitPage = 10;
}
