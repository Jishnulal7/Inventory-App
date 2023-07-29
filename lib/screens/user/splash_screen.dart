import 'dart:async';

import 'package:flutter/material.dart';
import 'package:inventory_app/screens/user/signup_screen.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static const id = 'splash_screen';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const SignUpScreen(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(
        context,
      ).primaryColor,
      body: const Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 70,
        ),
        child: Center(
          child: Text(
            'Inventory',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
