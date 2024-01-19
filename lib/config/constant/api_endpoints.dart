class ApiEndpoints {
  ApiEndpoints._();

  static const Duration connectionTimeout = Duration(seconds: 1000);
  static const Duration receiveTimeout = Duration(seconds: 1000);

  // static const String baseUrl = "http://localhost:5000/api/";

  static const String baseUrl = 'http://10.0.2.2:5000/api/user';

  // ====================== Auth Routes ======================
  static const String login = "/login";
  static const String register = "/create";
}
