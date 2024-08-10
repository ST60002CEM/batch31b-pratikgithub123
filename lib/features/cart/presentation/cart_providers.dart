// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:fruit_ordering_app/features/cart/data/repository/cart_remote_repository.dart';
// import 'package:fruit_ordering_app/features/cart/domain/use_case/cart_usecase.dart';

// import 'package:fruit_ordering_app/features/cart/presentation/viewmodel/cart_viewmodel.dart';
// import 'package:fruit_ordering_app/providers.dart'; // Ensure this is correctly importing your providers

// // Provide CartRemoteRepository
// final cartRemoteRepositoryProvider = Provider<CartRemoteRepository>((ref) {
//   final apiService = ref.read(apiServiceProvider);
//   return CartRemoteRepository(apiService);
// });

// // Provide CartUseCases
// final cartUseCasesProvider = Provider<CartUseCases>((ref) {
//   final repository = ref.read(cartRemoteRepositoryProvider);
//   return CartUseCases(repository);
// });

// // Provide CartViewModel
// final cartViewModelProvider = StateNotifierProvider<CartViewModel, CartState>((ref) {
//   final useCases = ref.read(cartUseCasesProvider);
//   return CartViewModel(useCases);
// });
