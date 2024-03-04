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

  static const limitPage = 10;
}
