import 'package:flutter/material.dart';
import 'package:fruit_ordering_app/features/products/data/dto/produtc_api_service.dart';
import 'package:fruit_ordering_app/features/products/data/model/products_api_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final productService = ProductService(baseUrl: 'YOUR_API_BASE_URL');

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Product Dashboard'),
        ),
        body: FutureBuilder(
          future: productService.getProducts(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              List<Product> products = snapshot.data as List<Product>;

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
