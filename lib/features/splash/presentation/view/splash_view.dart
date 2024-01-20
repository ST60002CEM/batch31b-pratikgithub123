import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fruit_ordering_app/core/routes/app_router.dart';

class SplashView extends ConsumerStatefulWidget {
  const SplashView({super.key});

  @override
  ConsumerState<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends ConsumerState<SplashView> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 1), () {
      Navigator.pushReplacementNamed(context, AppRoute.loginRoute);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    
    return Material(
      
      child: Container(
        padding: const EdgeInsets.only(top: 100, bottom: 40),
        decoration: const BoxDecoration(
            color: Colors.black,
            image: DecorationImage(
                image: AssetImage("assets/images/fruits.png"),
                fit: BoxFit.cover,
                opacity: 0.6)),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Fruit Shop",
              style: TextStyle(
                fontFamily: 'Times',
                fontSize: 50,
                color: Colors.white,
              ),
            ),
            Column(children: [
              Text(
                "Fresh Fruits at Your Fingertips, Order Now.",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontFamily: "Times",
                    letterSpacing: 2),
              ),
              SizedBox(height: 120),
              CircularProgressIndicator(
                color: Colors.amber,
              ),
              SizedBox(height: 10),
            ])
          ],
        ),
      ),
    );
  }
}
