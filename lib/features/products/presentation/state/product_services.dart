import 'dart:convert';

import 'package:fruit_ordering_app/features/products/data/model/product_api_model.dart';
import 'package:http/http.dart' as http;

class ProductService {
  final String baseUrl2;

  ProductService({required this.baseUrl2});

  Future<List<Product>> getProducts() async {
    final response = await http.get(Uri.parse(baseUrl2));

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);

      // Assuming that the products are nested under a key 'products'
      final List<dynamic> productList = responseData['products'];

      return productList.map((json) => Product.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}
