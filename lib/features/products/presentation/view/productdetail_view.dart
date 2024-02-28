import 'package:flutter/material.dart';
import 'package:fruit_ordering_app/features/products/data/model/product_api_model.dart';

class ProductDetailPage extends StatelessWidget {
  final Product product;
  final VoidCallback onAddToCart;

  const ProductDetailPage({
    Key? key,
    required this.product,
    required this.onAddToCart,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Detail'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(product.productImageUrl),
          Text('Name: ${product.productName}'),
          Text('Price: \RS${product.productPrice}'),
          ElevatedButton(
            onPressed: onAddToCart,
            child: Text('Add to Cart'),
          ),
        ],
      ),
    );
  }
}