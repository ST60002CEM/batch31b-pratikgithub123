import 'package:dartz/dartz.dart';
import 'package:fruit_ordering_app/core/failure/failure.dart';
import 'package:fruit_ordering_app/features/auth/domain/entity/auth_entity.dart';
import 'package:fruit_ordering_app/features/auth/domain/repository/auth_repository.dart';


class AuthUseCase {
  final IAuthRepository _authRepository;

  AuthUseCase(this._authRepository);

  Future<Either<Failure, bool>> registerUser(AuthEntity user) async {
    return await _authRepository.registerUser(user);
  }

  Future<Either<Failure, bool>> loginUser(
      String username, String password) async {
    return await _authRepository.loginUser(username, password);
  }
}
