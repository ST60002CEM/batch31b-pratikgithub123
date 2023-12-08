import 'package:flutter/material.dart';
import 'package:fruit_ordering_app/view/navigation_view/about_view.dart';
import 'package:fruit_ordering_app/view/navigation_view/cart_view.dart';
import 'package:fruit_ordering_app/view/navigation_view/home_view.dart';
import 'package:fruit_ordering_app/view/navigation_view/profile_view.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  var _selectedIndex = 1;
  List<Widget> lstbottomScreen = [
    const HomeView(),
    const CartView(),
    const ProfileView(),
    const AboutView(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text('Dashboard Navigation'),
        centerTitle: true,
      ),
      body: lstbottomScreen[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.face),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'About Us',
          ),
        ],
        selectedItemColor: Colors.amber,
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
