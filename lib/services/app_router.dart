import 'package:flutter/material.dart';
import 'package:inventory_app/screens/product/bin.dart';
import 'package:inventory_app/screens/home_screen.dart';
import 'package:inventory_app/screens/user/signin_screen.dart';
import 'package:inventory_app/screens/user/signup_screen.dart';
import 'package:inventory_app/screens/user/splash_screen.dart';

class AppRouter {
  Route? onGenerateRoute(routeSettings) {
    switch (routeSettings.name) {
      case RecycleBin.id:
        return MaterialPageRoute(
          builder: (_) => const RecycleBin(),
        );
      case HomeScreen.id:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
      case SignInScreen.id:
        return MaterialPageRoute(
          builder: (_) => const SignInScreen(),
        );
      case SignUpScreen.id:
        return MaterialPageRoute(
          builder: (_) => const SignUpScreen(),
        );
        case SplashScreen.id:
        return MaterialPageRoute(builder: (_)=> const SplashScreen());
      default:
        return null;
    }
  }
}
