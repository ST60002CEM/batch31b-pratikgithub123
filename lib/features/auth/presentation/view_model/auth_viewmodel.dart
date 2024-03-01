import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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

  Future<void> registerUser(AuthEntity entity) async {
    state = state.copyWith(isLoading: true);
    final result = await _registerUseCase.registerUser(entity);
    state = state.copyWith(isLoading: false);
    result.fold(
      (failure) => state = state.copyWith(error: failure.error),
      (success) => state = state.copyWith(isLoading: false, showMessage: true),
    );
  }

  //Login
  Future<void> loginUser(
      BuildContext context, String username, String password) async {
    state = state.copyWith(isLoading: true);
    final result = await _loginUseCase.loginUser(username, password);
    state = state.copyWith(isLoading: false);
    result.fold(
      (failure) {
        state = state.copyWith(
          error: failure.error,
          showMessage: true,
        );

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red, // Background color of the snackbar
            content: Text(
              failure.error, // Display the error message from the backend
              style: TextStyle(color: Colors.white), // Text color
            ),
            duration: Duration(seconds: 3), // Duration to display the snackbar
            behavior: SnackBarBehavior
                .floating, // Make the snackbar float above the bottom navigation bar
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                  top: Radius.circular(10)), // Rounded corners
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

        // Navigator.popAndPushNamed(context, AppRoute.homeViewRoute);
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
