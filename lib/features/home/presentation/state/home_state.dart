import 'package:flutter/widgets.dart';
import 'package:fruit_ordering_app/features/home/presentation/view/bottom_navigation/about_view.dart';
import 'package:fruit_ordering_app/features/home/presentation/view/bottom_navigation/cart_view.dart';
import 'package:fruit_ordering_app/features/home/presentation/view/bottom_navigation/dashboard.dart';
import 'package:fruit_ordering_app/features/products/presentation/view/product_view.dart';

class HomeState {
  int index;
  final List<Widget> lstWidget;

  HomeState({required this.index, required this.lstWidget});

  HomeState.initial()
      : index = 0,
        lstWidget = [
          const DashboardView(),
          ProductView(),
          const CartView(),
          const AboutView(),
        ];

  HomeState copywith({
    int? index,
  }) {
    return HomeState(index: index ?? this.index, lstWidget: lstWidget);
  }
}
