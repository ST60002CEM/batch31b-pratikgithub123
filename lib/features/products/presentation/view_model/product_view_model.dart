import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fruit_ordering_app/features/products/data/data_source/product_remote_datasource.dart';
import 'package:fruit_ordering_app/features/products/presentation/state/product_state.dart';


final productViewModelProvider =
    StateNotifierProvider<ProductViewModel, ProductState>((ref) {
  final productRemoteDataSource = ref.read(productRemoteDataSourceProvider);
  return ProductViewModel(productRemoteDataSource);
});

class ProductViewModel extends StateNotifier<ProductState> {
  final ProductRemoteDataSource productRemoteDataSource;
  ProductViewModel(this.productRemoteDataSource)
      : super(ProductState.initial());

  Future getProducts() async {
    state = state.copyWith(isLoading: true);
    final currentState = state;
    final page = currentState.page + 1;
    final products = currentState.productapimodel;
    final hasReachedmax = currentState.hasReachedmax;
    if (!hasReachedmax) {
      final result = await productRemoteDataSource.getProducts(page);
      print(result);
      result.fold(
          (Failure) => state =
              state.copyWith(isLoading: true, hasReachedmax: false), (data) {
        if (data.isEmpty) {
          state = state.copyWith(hasReachedmax: true);
        } else {
          state = state.copyWith(
            productapimodel: [...products, ...data],
            page: page,
            isLoading: false,
          );
        }
      });
    }
  }

  Future resetState() async {
    state = ProductState.initial();
    getProducts();
  }
}
