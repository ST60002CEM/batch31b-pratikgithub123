// import 'package:dartz/dartz.dart';
// import 'package:dio/dio.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:fruit_ordering_app/config/constant/api_endpoints.dart';
// import 'package:fruit_ordering_app/core/failure/failure.dart';
// import 'package:fruit_ordering_app/core/network/http_service.dart';

// final productDataSourceProvider = Provider<ProductDataSource>((ref) {
//   final dio = ref.read(httpServiceProvider);
//   return ProductDataSource(dio);
// });

// class ProductDataSource {
//   final Dio _dio;
//   ProductDataSource(this._dio);

//   // get data from post with pagination
//   Future<Either<Failure, List<Products>>> getProducts(int page) async {
//     try {
//       final response = await _dio.get(
//         ApiEndpoints.product,
//         queryParameters: {
//           '_page': page,
//           '_limit': ApiEndpoints.limitPage,
//         },
//       );
//       final data = response.data as List;
//       final posts = data.map((e) => Products.fromJson(e)).toList();
//       return Right(posts);
//     } on DioException catch (e) {
//       return Left(Failure(message: e.message.toString(), error: ''));
//     }
//   }
// }
