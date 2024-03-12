import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kings_cogent_app/home_page.dart';
import 'package:kings_cogent_app/screens/splash_screen.dart';
import 'package:kings_cogent_app/sign_in_screen.dart';
import 'package:kings_cogent_app/sign_up_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
      // home: const SplashScreen(),
      // home: const SignUpPage(),
      // home: const SignInScreen(),
    );
  }
}
