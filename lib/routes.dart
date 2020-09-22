import 'package:diet_tracker/constants.dart';
import 'package:diet_tracker/pages/calendar.dart';
import 'package:diet_tracker/pages/home.dart';
import 'package:flutter/material.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeRoute:
        return MaterialPageRoute(builder: (_) => Homepage());
      case calendarRoute:
        return MaterialPageRoute(builder: (_) => Calendar());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
