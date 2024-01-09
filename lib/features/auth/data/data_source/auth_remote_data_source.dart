import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fruit_ordering_app/config/constant/api_endpoints.dart';
import 'package:fruit_ordering_app/core/failure/failure.dart';
import 'package:fruit_ordering_app/core/network/http_service.dart';
import 'package:fruit_ordering_app/core/shared_pref/user_shared_prefs.dart';
import 'package:fruit_ordering_app/features/auth/data/model/auth_api_model.dart';
import 'package:fruit_ordering_app/features/auth/domain/entity/auth_entity.dart';

final authRemoteDataSourceProvider = Provider<AuthRemoteDataSource>(
    (ref) => AuthRemoteDataSource(ref.read(httpServiceProvider)));

class AuthRemoteDataSource {
  final Dio dio;

  AuthRemoteDataSource(this.dio);

  Future<Either<Failure, bool>> registerUser(AuthEntity user) async {
    try {
      AuthApiModel apiModel = AuthApiModel.fromEntity(user);
      Response response = await dio.post(
        ApiEndpoints.register,
        data: {
          "fullname": apiModel.fullname,
          "location": apiModel.location,
          "phonemun": apiModel.phonenum,
          "username": apiModel.username,
          "password": apiModel.password,
        },

        
      );
      if (response.statusCode == 200) {
        return const Right(true);
      } else {
        return Left(
          Failure(
            error: response.data["message"],
            statusCode: response.statusCode.toString(),
          ),
        );
      }
    } on DioException catch (e) {
      return Left(
        Failure(
          error: e.error.toString(),
          statusCode: e.response?.statusCode.toString() ?? '0',
        ),
      );
    }
  }

  Future<Either<Failure, bool>> loginUser(
    String username,
    String password,
  ) async {
    try {
      Response response = await dio.post(
        ApiEndpoints.login,
        data: {
          "username": username,
          "password": password,
        },
      );
      if (response.statusCode == 200) {
        // retrieve token
        String token = response.data["token"];
        await UserSharedPrefs().setUserToken(token);
        return const Right(true);
      } else {
        return Left(
          Failure(
            error: response.data["message"],
            statusCode: response.statusCode.toString(),
          ),
        );
      }
    } on DioException catch (e) {
      return Left(
        Failure(
          error: e.error.toString(),
          statusCode: e.response?.statusCode.toString() ?? '0',
        ),
      );
    }
  }
}
