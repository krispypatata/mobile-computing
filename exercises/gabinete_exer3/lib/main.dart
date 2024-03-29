/*
  Name: Gabinete, Keith Ginoel S.
  Student No.: 2020-03670
  Lab Section: CMSC 23 - UV 5L

  Laboratory Exercise #02 : OOP in Dart
  Date created: March 08, 2024

  Program Description:
    This is a straightforward Flutter application that aims to emulate the UI design of an Instagram profile, albeit in a simplified manner.
 */

import 'package:flutter/material.dart';
import 'my_home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyHomePage(title: "@shio"));
  }
}
