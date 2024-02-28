class Product {
  final String productName;
  final int productPrice;
  final String productDescription;
  final String productCategory;
  final String productImageUrl;
  final DateTime createdAt;

  Product({
    required this.productName,
    required this.productPrice,
    required this.productDescription,
    required this.productCategory,
    required this.productImageUrl,
    required this.createdAt,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      productName: json['productName'],
      productPrice: json['productPrice'],
      productDescription: json['productDescription'],
      productCategory: json['productCategory'],
      productImageUrl: json['productImageUrl'],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }
}
