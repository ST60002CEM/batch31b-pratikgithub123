import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        width:double.infinity,
        height:double.infinity,
        decoration:BoxDecoration(
          gradient: LinearGradient(
            begin:Alignment.topRight,
            end:Alignment.bottomRight,
            colors:[
              Color(0xFFFF8008),
              Color(0xFFCE1010),

            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            
            Image.asset(
              'assets/images/pizza.png',
              height:300.0,
              width:300.0,

            ),
            Text(
              "A whole food app\n att your fingertips"
            )
          ],
        ),
      ),
    );
  }
} 