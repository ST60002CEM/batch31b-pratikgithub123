

// class ProductState {
//   final List<Products> products;
//   final bool hasReachedMax;
//   final int page;
//   final bool isLoading;

//   ProductState({
//     required this.products,
//     required this.hasReachedMax,
//     required this.page,
//     required this.isLoading,
//   });

//   factory ProductState.initial() {
//     return ProductState(
//       products: [],
//       hasReachedMax: false,
//       page: 0,
//       isLoading: false,
//     );
//   }

//   ProductState copyWith({
//     List<Products>? products,
//     bool? hasReachedMax,
//     int? page,
//     bool? isLoading,
//   }) {
//     return ProductState(
//       products: products ?? this.products,
//       hasReachedMax: hasReachedMax ?? this.hasReachedMax,
//       page: page ?? this.page,
//       isLoading: isLoading ?? this.isLoading,
//     );
//   }
// }
