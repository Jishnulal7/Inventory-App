import 'package:flutter/material.dart';
import 'package:inventory_app/screens/home/homescreen.dart';
import 'package:inventory_app/screens/home/splash_screen.dart';
import 'package:inventory_app/utils/themes.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: theme(),
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}