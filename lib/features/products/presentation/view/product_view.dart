import 'package:flutter/material.dart';
import 'package:fruit_ordering_app/features/products/data/model/product_model.dart';
import 'package:fruit_ordering_app/features/products/presentation/state/product_services.dart';

class ProductView extends StatefulWidget {
  final productService = ProductService(
      baseUrl2: 'http://localhost:5000/api/product/get_products');

  ProductView({super.key});

  @override
  _ProductViewState createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  final ScrollController _scrollController = ScrollController();
  List<Product> products = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
    _loadProducts();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      // Reached the end of the list, load more products
      _loadProducts();
    }
  }

  Future<void> _loadProducts() async {
    if (!isLoading) {
      setState(() {
        isLoading = true;
      });

      final newProducts = await widget.productService.getProducts();

      // Append new products to the existing list
      products.addAll(newProducts);

      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> _refreshProducts() async {
    setState(() {
      isLoading = true;
      products = [];
    });

    await _loadProducts();

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Product List'),
          actions: [
            IconButton(
              icon: const Icon(Icons.refresh),
              onPressed: () {
                // Refresh button tapped
                _refreshProducts();
              },
            ),
          ],
        ),
        body: RefreshIndicator(
          onRefresh: _refreshProducts,
          child: ListView.builder(
            controller: _scrollController,
            itemCount: products.length + 1,
            itemBuilder: (context, index) {
              if (index < products.length) {
                return ListTile(
                  title: Text(products[index].productName),
                  subtitle: Text(products[index].productDescription),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductDetailPage(
                          product: products[index],
                        ),
                      ),
                    );
                  },
                );
              } else if (isLoading) {
                // Display a loading indicator while loading more products
                return const Center(child: CircularProgressIndicator());
              } else {
                // Reached the end of the list and no more products to load
                return const SizedBox();
              }
            },
          ),
        ),
      ),
    );
  }
}

class ProductDetailPage extends StatelessWidget {
  final Product product;

  const ProductDetailPage({super.key, required this.product});

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
          Text('Price: \$${product.productPrice}'),
          Text('Description: ${product.productDescription}'),
          // Add more details as needed
        ],
      ),
    );
  }
}
