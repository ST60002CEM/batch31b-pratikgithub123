import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fruit_ordering_app/features/products/data/model/product_api_models.dart';

class Product_Detail extends ConsumerStatefulWidget {
  const Product_Detail({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _Product_DetailState();
}

class _Product_DetailState extends ConsumerState<Product_Detail> {
  @override
  Widget build(BuildContext context) {
    var products =
        ModalRoute.of(context)!.settings.arguments as ProductApiModel;
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Detail'),
      ),
      body: Column(
        children: [
          Image.network(products.productImageUrl),
          Text('Name: ${products.productName.toString()}'),
          Text('Description: ${products.productDescription.toString()}'),
          Text('Price Rs: ${products.productPrice.toString()}'),
        ],
      ),
    );
  }
}
