import 'package:flutter/material.dart';
import 'package:fruit_ordering_app/features/products/data/model/product_api_model.dart';
import 'package:fruit_ordering_app/features/products/presentation/state/product_services.dart';

class ProductView extends StatefulWidget {
  final productService =
      ProductService(baseUrl2: 'http://10.0.2.2:5000/api/product/get_products');

  ProductView({Key? key}) : super(key: key);

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
      // load more products
      _loadProducts();
    }
  }

  Future<void> _loadProducts() async {
    if (!isLoading) {
      setState(() {
        isLoading = true;
      });

      final newProducts = await widget.productService.getProducts();

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
                return InkWell(
                  onTap: () {
                   
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductDetailPage(
                          product: products[index],
                          onAddToCart: () {
                            
                          },
                        ),
                      ),
                    );
                  },
                  child: ListTile(
                    title: Text(products[index].productName),
                    subtitle: Text(products[index].productDescription),
                    leading: Image.network(
                      products[index].productImageUrl,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              } else if (isLoading) {
                
                return const Center(child: CircularProgressIndicator());
              } else {
                // No more products to load
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
          Text('Description: ${product.productDescription}'),
          ElevatedButton(
            onPressed: onAddToCart,
            child: Text('Add to Cart'),
          ),
        ],
      ),
    );
  }
}
