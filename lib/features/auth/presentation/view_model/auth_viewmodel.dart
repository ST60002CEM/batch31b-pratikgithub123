import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fruit_ordering_app/core/routes/app_router.dart';
import 'package:fruit_ordering_app/features/auth/domain/entity/auth_entity.dart';
import 'package:fruit_ordering_app/features/auth/domain/use_case/login_usecase.dart';
import 'package:fruit_ordering_app/features/auth/domain/use_case/register_usecase.dart';
import 'package:fruit_ordering_app/features/auth/presentation/state/auth_state.dart';

final authViewModelProvider = StateNotifierProvider<AuthViewModel, AuthState>(
  (ref) => AuthViewModel(
    ref.read(registerUseCaseProvider),
    ref.read(loginUseCaseProvider),
  ),
);

class AuthViewModel extends StateNotifier<AuthState> {
  final LoginUseCase _loginUseCase;
  final RegisterUseCase _registerUseCase;

  AuthViewModel(
    this._registerUseCase,
    this._loginUseCase,
  ) : super(AuthState.initial());

  Future<void> registerUser(AuthEntity entity, BuildContext context) async {
    state = state.copyWith(isLoading: false);
    final result = await _registerUseCase.registerUser(entity);
    result.fold(
      (failure) {
        state = state.copyWith(
            error: failure.error, isLoading: true, showMessage: true);
        return ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red,
            content: Text('${failure.error}'),
          ),
        );
      },
      (success) {
        state = state.copyWith(isLoading: false);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.green, // Background color of the snackbar
            content: Text(
              'Register Success',
              style: TextStyle(color: Colors.white), // Text color
            ),
            duration: Duration(seconds: 3),
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
            ),
          ),
        );
        Navigator.pushNamed(context, AppRoute.loginRoute);
      },
    );
  }

  //Login
  Future<void> loginUser(
      BuildContext context, String username, String password) async {
    state = state.copyWith(isLoading: false);
    final result = await _loginUseCase.loginUser(username, password);
    result.fold(
      (failure) {
        state = state.copyWith(
          isLoading: true,
          error: failure.error,
          showMessage: true,
        );
        return ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red,
            content: Text(
              failure.error,
              style: TextStyle(color: Colors.white), // Text color
            ),
            duration: Duration(seconds: 3),
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
            ),
          ),
        );
      },
      (success) {
        state = state.copyWith(
          isLoading: false,
          showMessage: true,
          error: null,
        );

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.green, // Background color of the snackbar
            content: Text(
              'Login Success',
              style: TextStyle(color: Colors.white), // Text color
            ),
            duration: Duration(seconds: 3),
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
            ),
          ),
        );
        Navigator.pushReplacementNamed(context, AppRoute.homeRoute);
      },
    );
    // result.fold(
    //   (failure) {
    //     state = state.copyWith(
    //       error: failure.error,
    //       showMessage: true,
    //     );
    //   },
    //   (success) {
    //     state = state.copyWith(
    //       isLoading: false,
    //       showMessage: true,
    //       error: null,
    //     );

    //     // Navigator.popAndPushNamed(context, AppRoute.dashboardRoute);
    //   },
    // );
  }

  void reset() {
    state = state.copyWith(
      isLoading: false,
      error: null,
      imageName: null,
      showMessage: false,
    );
  }

  void resetMessage(bool value) {
    state = state.copyWith(showMessage: value);
  }
}
