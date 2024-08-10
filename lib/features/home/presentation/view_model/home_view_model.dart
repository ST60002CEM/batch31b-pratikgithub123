import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fruit_ordering_app/core/routes/app_router.dart';
import 'package:fruit_ordering_app/features/home/presentation/state/home_state.dart';

final homeViewModelProvider =
    StateNotifierProvider<HomeViewModel, HomeState>((ref) => HomeViewModel());

class HomeViewModel extends StateNotifier<HomeState> {
  HomeViewModel() : super(HomeState.initial());

  void changeIndex(int index) {
    state = state.copywith(index: index);
  }

  void signOut(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.green, // Background color of the snackbar
        content: Text(
          'Log Out Successfully',
          style: TextStyle(color: Colors.white), // Text color
        ),
        duration: Duration(seconds: 3),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
        ),
      ),
    );
    Navigator.pushReplacementNamed(context, AppRoute.loginRoute);
  }
}
