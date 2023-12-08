import 'package:flutter/material.dart';
import 'package:fruit_ordering_app/app/theme/theme_data.dart';
import 'package:fruit_ordering_app/view/login.dart';

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: getApplicationTheme(),
      home: const MyLogin(),
    );
  }
}
