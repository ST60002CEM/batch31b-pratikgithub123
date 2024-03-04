// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_api_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductApiModel _$ProductApiModelFromJson(Map<String, dynamic> json) =>
    ProductApiModel(
      productName: json['productName'] as String,
      productPrice: json['productPrice'] as int,
      productDescription: json['productDescription'] as String,
      productCategory: json['productCategory'] as String,
      productImageUrl: json['productImageUrl'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$ProductApiModelToJson(ProductApiModel instance) =>
    <String, dynamic>{
      'productName': instance.productName,
      'productPrice': instance.productPrice,
      'productDescription': instance.productDescription,
      'productCategory': instance.productCategory,
      'productImageUrl': instance.productImageUrl,
      'createdAt': instance.createdAt.toIso8601String(),
    };
