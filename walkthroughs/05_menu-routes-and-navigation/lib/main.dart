import 'package:flutter/material.dart';
import 'first_route.dart';
import 'second_route.dart';
import 'ScreenArguments.dart';

void main() {
  runApp(MaterialApp(
    title: 'Navigation Basics',
    initialRoute: '/',
    routes: {
      '/': (context) => const FirstRoute(),
      '/second': (context) => const SecondRoute()
    },
    onGenerateRoute: (settings) {
      if (settings.name == SecondRoute.routename) {
        final args = settings.arguments as ScreenArguments;
        return MaterialPageRoute(builder: (context) {
          return SecondRoute(title: args.title, message: args.message);
        });
      }
      return null;
    },
  ));
}
