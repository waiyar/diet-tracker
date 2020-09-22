import 'package:diet_tracker/constants.dart';
import 'package:flutter/material.dart';
import 'package:diet_tracker/routes.dart';

void main() => runApp(DietApp());

class DietApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Diet Tracker',
      onGenerateRoute: Router.generateRoute,
      initialRoute: homeRoute,
    );
  }
}
