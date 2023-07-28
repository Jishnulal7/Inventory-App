import 'package:flutter/material.dart';
import 'package:inventory_app/screens/bin.dart';
import 'package:inventory_app/screens/tab_screen.dart';

class AppRouter {
  Route? onGenerateRoute(routeSettings) {
    switch (routeSettings.name) {
      case RecycleBin.id:
        return MaterialPageRoute(
          builder: (_) => const RecycleBin(),
        );
      case TabScreen.id:
        return MaterialPageRoute(
          builder: (_) =>  const TabScreen(),
        );
      default:
        return null;
    }
  }
}
