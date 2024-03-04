// import 'package:dartz/dartz.dart';
// import 'package:dio/dio.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:glowglam/config/constants/api_endpoint.dart';
// import 'package:glowglam/core/failure/failure.dart';
// import 'package:glowglam/core/network/remote/http_service.dart';
// import 'package:glowglam/features/pagination/data/model/product_api_model.dart';

// final productRemoteDataSourceProvider = Provider((ref) {
//   final dio = ref.read(httpServiceProvider);
//   return ProductRemoteDataSource(dio);
// });

// class ProductRemoteDataSource {
//   final Dio dio;
//   ProductRemoteDataSource(this.dio);

//   //Making get request to fetch data
//   Future<Either<Failure, List<ProductApiModel>>> getProducts(int page) async {
//     try {
//       final response = await dio
//           .get(ApiEndpoints.getProduct, queryParameters: {'page': page});
//       print(response.data);
//       final List<dynamic> data = response.data['products'];
//       final post = data.map((json) => ProductApiModel.fromJson(json)).toList();
//       return Right(post);
//     } on DioException catch (e) {
//       return Left(Failure(error: e.message.toString()));
//     }
//   }
// }

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fruit_ordering_app/config/constant/api_endpoints.dart';
import 'package:fruit_ordering_app/core/network/failure.dart';
import 'package:fruit_ordering_app/core/network/http_service.dart';
import 'package:fruit_ordering_app/features/products/data/model/product_api_models.dart';

final productRemoteDataSourceProvider = Provider((ref) {
  final dio = ref.read(httpServiceProvider);
  return ProductRemoteDataSource(dio);
});

class ProductRemoteDataSource {
  final Dio dio;
  ProductRemoteDataSource(this.dio);

  Future<Either<Failure, List<ProductApiModel>>> getProducts(int page) async {
    try {
      final response = await dio
          .get(ApiEndpoints.product, queryParameters: {'page': page});
      // print(response);
      print(response.data);
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data["products"];
        final posts =
            data.map((json) => ProductApiModel.fromJson(json)).toList();
        return Right(posts);
      } else {
        print(response);
        return Left(Failure(
            error: "Unexpected server response: ${response.statusCode}"));
      }
    } catch (e) {
      print(e.toString());
      return Left(Failure(error: e.toString()));
    }
  }
}
