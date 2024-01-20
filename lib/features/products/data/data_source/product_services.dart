import 'dart:convert';

import 'package:fruit_ordering_app/features/products/data/model/product_model.dart';
import 'package:http/http.dart' as http;

class ProductService {
  final String baseUrl = 'http://10.0.2.2:5000/api/product';

  ProductService({required this.baseUrl});

  Future<List<Product>> getProducts() async {
    final response = await http.get(Uri.parse('$baseUrl/get_products'));

    if (response.statusCode == 200) {
      print('Request URL: $baseUrl/get_products');
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      final List<dynamic> data = json.decode(response.body)['products'];
      return data.map((json) => Product.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}
