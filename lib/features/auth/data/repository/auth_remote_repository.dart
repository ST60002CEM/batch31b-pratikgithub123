import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fruit_ordering_app/core/network/failure.dart';
import 'package:fruit_ordering_app/features/auth/data/data_source/auth_remote_data_source.dart';
import 'package:fruit_ordering_app/features/auth/domain/entity/auth_entity.dart';
import 'package:fruit_ordering_app/features/auth/domain/repository/auth_repository.dart';

final authRemoteRepositoryProvider = Provider<IAuthRepository>(
  (ref) => AuthRemoteRepository(
    ref.read(authRemoteDataSourceProvider),
  ),
);
class AuthRemoteRepository implements IAuthRepository {
  final AuthRemoteDataSource _authRemoteDataSource;

  AuthRemoteRepository(this._authRemoteDataSource);

  @override
  Future<Either<Failure, bool>> loginUser(
      String email, String password) async {
    return await _authRemoteDataSource.loginUser(email, password);
  }

  @override
  Future<Either<Failure, bool>> registerUser(AuthEntity user) async {
    return await _authRemoteDataSource.registerUser(user);
  }

 
}
