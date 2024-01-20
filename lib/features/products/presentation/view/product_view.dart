import 'package:flutter/material.dart';
import 'package:fruit_ordering_app/features/products/data/model/product_model.dart';
import 'package:fruit_ordering_app/features/products/presentation/state/product_services.dart';

class ProductView extends StatelessWidget {
  final ProductService productService = ProductService(
    baseUrl2: 'http://10.0.2.2:5000/api/product',
  );

  ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Product Dashboard'),
        ),
        body: FutureBuilder<List<Product>>(
          future: productService.getProducts(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              List<Product> products = snapshot.data!;

              return ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(products[index].productName),
                    subtitle: Text(products[index].productDescription),
                    // Add more fields as needed
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
