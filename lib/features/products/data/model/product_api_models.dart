import 'package:fruit_ordering_app/features/products/domain/entity/product_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product_api_models.g.dart';

@JsonSerializable()
class ProductApiModel {
  @JsonKey(name: 'productName')
  final String productName;
  @JsonKey(name: 'productPrice')
  final int productPrice;
  @JsonKey(name: 'productDescription')
  final String productDescription;
  @JsonKey(name: 'productCategory')
  final String productCategory;
  @JsonKey(name: 'productImageUrl')
  final String productImageUrl;
  @JsonKey(name: 'createdAt')
  final DateTime createdAt;

  ProductApiModel({
    required this.productName,
    required this.productPrice,
    required this.productDescription,
    required this.productCategory,
    required this.productImageUrl,
    required this.createdAt,
  });

  factory ProductApiModel.fromJson(Map<String, dynamic> json) =>
      _$ProductApiModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductApiModelToJson(this);

  factory ProductApiModel.toEntity(ProductApiModel productApiModel) {
    return ProductApiModel(
        productName: productApiModel.productName,
        productPrice: productApiModel.productPrice,
        productDescription: productApiModel.productDescription,
        productCategory: productApiModel.productCategory,
        productImageUrl: productApiModel.productImageUrl,
        createdAt: productApiModel.createdAt);
  }

  factory ProductApiModel.fromEntity(ProductEntity entity) {
    return ProductApiModel(
      productName: entity.productName,
      productPrice: entity.productPrice,
      productDescription: entity.productDescription,
      productCategory: entity.productCategory,
      productImageUrl: entity.productImageUrl,
      createdAt: entity.createdAt,
    );
  }
}
