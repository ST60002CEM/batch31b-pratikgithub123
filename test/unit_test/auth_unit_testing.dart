import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fruit_ordering_app/core/failure/failure.dart';
import 'package:fruit_ordering_app/features/auth/domain/use_case/login_usecase.dart';
import 'package:fruit_ordering_app/features/auth/domain/use_case/register_usecase.dart';
import 'package:fruit_ordering_app/features/auth/presentation/view_model/auth_viewmodel.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'auth_unit_testing.mocks.dart';

// flutter packages pub run build_runner build

@GenerateNiceMocks([
  MockSpec<RegisterUseCase>(),
  MockSpec<LoginUseCase>(),
  MockSpec<BuildContext>(),
])
void main() {
  late RegisterUseCase mockRegisterUseCase;
  late LoginUseCase mockLoginUseCase;
  late ProviderContainer container;
  late BuildContext context;

  setUpAll(() {
    mockRegisterUseCase = MockRegisterUseCase();
    mockLoginUseCase = MockLoginUseCase();
    context = MockBuildContext();
    container = ProviderContainer(
      overrides: [
        authViewModelProvider.overrideWith(
          (ref) => AuthViewModel(mockRegisterUseCase, mockLoginUseCase),
        ),
      ],
    );
  });
  test('Check for initial test', () async {
    final AuthState = container.read(authViewModelProvider);
    expect(AuthState.isLoading, false);
    expect(AuthState.error, isNull);
    expect(AuthState.showMessage, false);
  });

  test('login test with valid username and password', () async {
    when(mockLoginUseCase.loginUser('pratik', 'pratik123'))
        .thenAnswer((_) => Future.value(const Right(true)));

    when(mockLoginUseCase.loginUser('pratik', 'pratik1234'))
        .thenAnswer((_) => Future.value(Left(Failure(error: 'invalid'))));

    await container
        .read(authViewModelProvider.notifier)
        .loginUser(context, '', '');

    final AuthState = container.read(authViewModelProvider);
    expect(AuthState.error, isNull);
  });

  test('check for invalid username and password', () async {
    when(mockLoginUseCase.loginUser('', ''))
        .thenAnswer((_) => Future.value(Left(Failure(error: 'Invalid'))));

    await container
        .read(authViewModelProvider.notifier)
        .loginUser(context, '', '');

    final AuthState = container.read(authViewModelProvider);

    expect(AuthState.error, 'Invalid');
  });

  tearDownAll(
    () => container.dispose(),
  );
}
