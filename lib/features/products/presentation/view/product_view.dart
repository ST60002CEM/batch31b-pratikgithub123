import 'package:flutter/material.dart';
import 'package:fruit_ordering_app/features/products/data/model/product_api_model.dart';
import 'package:fruit_ordering_app/features/products/presentation/state/product_services.dart';
import 'package:fruit_ordering_app/features/products/presentation/view/productdetail_view.dart';

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
  bool hasMoreProducts = true;
  String selectedSort = 'Name (A-Z)'; // Default sorting

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
      // Remove this call from here
      // _loadProducts();
    }
  }

  Future<void> _loadProducts() async {
    if (!isLoading && hasMoreProducts) {
      setState(() {
        isLoading = true;
      });

      final newProducts = await widget.productService.getProducts();

      if (newProducts.isEmpty) {
        hasMoreProducts = false;
      } else {
        products.addAll(newProducts);
      }

      _sortProducts(); // Sort the products after loading

      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> _refreshProducts() async {
    setState(() {
      isLoading = true;
      // products = [];
      hasMoreProducts = true;
    });

    // Keep the load products call only here
    await _loadProducts();

    setState(() {
      isLoading = false;
    });
  }

  void _sortProducts() {
    switch (selectedSort) {
      case 'Name (A-Z)':
        products.sort((a, b) => a.productName.compareTo(b.productName));
        break;
      case 'Name (Z-A)':
        products.sort((a, b) => b.productName.compareTo(a.productName));
        break;
      case 'Price (Low-High)':
        products.sort((a, b) => a.productPrice.compareTo(b.productPrice));
        break;
      case 'Price (High-Low)':
        products.sort((a, b) => b.productPrice.compareTo(a.productPrice));
        break;
    }
  }

  Widget _buildSortDropdown() {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text('Sort By: '),
          SizedBox(width: 8.0),
          DropdownButton<String>(
            value: selectedSort,
            onChanged: (String? newValue) {
              setState(() {
                selectedSort = newValue!;
                _sortProducts();
              });
            },
            items: <String>[
              'Name (A-Z)',
              'Name (Z-A)',
              'Price (Low-High)',
              'Price (High-Low)',
            ].map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
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
        body: Column(
          children: [
            _buildSortDropdown(),
            Expanded(
              child: RefreshIndicator(
                onRefresh: _refreshProducts,
                child: GridView.builder(
                  controller: _scrollController,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8.0,
                    mainAxisSpacing: 8.0,
                  ),
                  itemCount: products.length + (isLoading ? 1 : 0),
                  itemBuilder: (context, index) {
                    if (index < products.length) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductDetailPage(
                                product: products[index],
                                onAddToCart: () {},
                              ),
                            ),
                          );
                        },
                        child: Card(
                          elevation: 2.0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Image.network(
                                  products[index].productImageUrl,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      products[index].productName,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16.0,
                                      ),
                                    ),
                                    Text(
                                      '\RS${products[index].productPrice}',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14.0,
                                        color: Colors.green,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    } else if (isLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else {
                      return Center(
                        child: Text('No more products'),
                      );
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
