import 'dart:async';
import 'package:flutter/material.dart';
import 'package:kings_cogent_app/home_page.dart';
// Your main app screen

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashScreen(), // Navigate to SplashScreen first
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Delay for 3 seconds and navigate to the main screen
    Timer(
      const Duration(seconds: 3),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      ),
    );

    return Scaffold(
      body: Center(
        child: Image.asset('assets/images/logo.jpg'),
      ),
    );
  }
}
