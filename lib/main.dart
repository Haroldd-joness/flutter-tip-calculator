import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:tip_calculator/screens/home_screen.dart';
import 'package:tip_calculator/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Tip Calculator",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/HomeScreen': (context) => const HomeScreen(),
      },
    );
  }
}
