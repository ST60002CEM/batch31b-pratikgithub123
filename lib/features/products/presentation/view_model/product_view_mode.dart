// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:fruit_ordering_app/features/products/data/data_source/product_data_source.dart';
// import 'package:fruit_ordering_app/features/products/presentation/state/product_state.dart';



// final productViewModelProvider =
//     StateNotifierProvider<ProductViewModel, ProductState>((ref) {
//   final productDataSource = ref.read(productDataSourceProvider);
//   return ProductViewModel(productDataSource);
// });

// class ProductViewModel extends StateNotifier<ProductState> {
//   final ProductDataSource _productDataSource;
//   ProductViewModel(
//     this._productDataSource,
//   ) : super(
//           ProductState.initial(),
//         ) {
//     getProducts();
//   }

//   Future resetState() async {
//     state = ProductState.initial();
//     getProducts();
//   }

//   Future getProducts() async {
//     state = state.copyWith(isLoading: true);
//     final currentState = state;
//     final page = currentState.page + 1;
//     final products = currentState.products;
//     final hasReachedMax = currentState.hasReachedMax;
//     if (!hasReachedMax) {
//       // get data from data source
//       final result = await _productDataSource.getProducts(page);
//       result.fold(
//         (failure) =>
//             state = state.copyWith(hasReachedMax: true, isLoading: false),
//         (data) {
//           if (data.isEmpty) {
//             state = state.copyWith(hasReachedMax: true);
//           } else {
//             state = state.copyWith(
//               products: [...products, ...data],
//               page: page,
//               isLoading: false,
//             );
//           }
//         },
//       );
//     }
//   }
// }
