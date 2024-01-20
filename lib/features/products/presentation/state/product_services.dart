import 'dart:convert';
import 'package:fruit_ordering_app/features/products/data/model/product_model.dart';
import 'package:http/http.dart' as http;

class ProductService {
  final String baseUrl2;

  ProductService({required this.baseUrl2});

  Future<List<Product>> getProducts() async {
    final response = await http.get(Uri.parse('$baseUrl2/get_products'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['products'];
      return data.map((json) => Product.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}
