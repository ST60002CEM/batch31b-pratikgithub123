

import 'package:fruit_ordering_app/features/products/data/model/product_api_models.dart';

class ProductState {
  final List<ProductApiModel> productapimodel;
  final bool hasReachedmax;
  final int page;
  final bool isLoading;

  ProductState(
      {required this.productapimodel,
      required this.hasReachedmax,
      required this.page,
      required this.isLoading});

  factory ProductState.initial() {
    return ProductState(
        productapimodel: [], hasReachedmax: false, page: 0, isLoading: false);
  }

  ProductState copyWith({
    List<ProductApiModel>? productapimodel,
    bool? hasReachedmax,
    int? page,
    bool? isLoading,
  }) {
    return ProductState(
        productapimodel: productapimodel ?? this.productapimodel,
        hasReachedmax: hasReachedmax ?? this.hasReachedmax,
        page: page ?? this.page,
        isLoading: isLoading ?? this.isLoading);
  }
}
