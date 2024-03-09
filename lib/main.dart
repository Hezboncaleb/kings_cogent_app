import 'package:flutter/material.dart';
import 'package:kings_cogent_app/home_page.dart';
import 'package:kings_cogent_app/sign_in_screen.dart';
import 'package:kings_cogent_app/sign_up_page.dart';

void main() {
  runApp(const LoanApp());
}

class LoanApp extends StatelessWidget {
  const LoanApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KINGS COGENT',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      debugShowCheckedModeBanner: false, // Remove debug banner
      home: const HomePage(),
      // home: const SignUpPage(),
      // home: const SignInScreen(),
    );
  }
}
