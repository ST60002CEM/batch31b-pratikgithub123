import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  final String? id;
  final String productName;
  final int productPrice;
  final String productDescription;
  final String productCategory;
  final String productImageUrl;
  final DateTime createdAt;

  const ProductEntity({
    this.id,
    required this.productName,
    required this.productPrice,
    required this.productDescription,
    required this.productCategory,
    required this.productImageUrl,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [
        id,
        productName,
        productPrice,
        productDescription,
        productCategory,
        productImageUrl,
        createdAt,
      ];
}
