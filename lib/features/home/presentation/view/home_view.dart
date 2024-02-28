import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fruit_ordering_app/features/home/presentation/view_model/home_view_model.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  @override
  Widget build(BuildContext context) {
    final homeState = ref.watch(homeViewModelProvider);
    return Scaffold(
      body: homeState.lstWidget[homeState.index],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard, color: Colors.black),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shop_two_outlined, color: Colors.black),
            label: 'Product',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.question_answer,
                color: Color.fromARGB(255, 66, 50, 50)),
            label: 'About',
          ),
        ],
        currentIndex: homeState.index,
        onTap: (index) {
          ref.read(homeViewModelProvider.notifier).changeIndex(index);
        },
      ),
    );
  }
}
