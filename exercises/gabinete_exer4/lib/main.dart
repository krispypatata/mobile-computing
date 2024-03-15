/*
  Name: Gabinete, Keith Ginoel S.
  Student No.: 2020-03670
  Lab Section: CMSC 23 - UV 5L

  Laboratory Exercise #04 : OOP in Dart
  Date created: March 15, 2024

  Program Description:
    This is a straightforward Flutter application that aims to emulate the UI design of an Instagram profile, albeit in a simplified manner.
 */

import 'package:flutter/material.dart';
import 'form.dart';

void main() {
  runApp(const MyApp());
}

const Color darkBlue = Color(0xFF2C2C3D);
const Color darkerBlue = Color(0xFF0B0B1A);
const Color customPurple = Color(0xFF644E9D);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exercise 4',
      theme: ThemeData(
        inputDecorationTheme: InputDecorationTheme(
          floatingLabelStyle: TextStyle(color: customPurple),
          labelStyle: TextStyle(color: Colors.grey),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Exercise 4",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              )),
          backgroundColor: darkerBlue,
          // centerTitle: true, // center title vertically
        ),
        body: Container(
          color: darkBlue,
          child: ListView(
            children: [
              // first child
              FormSample(),
            ],
          ),
        ),
      ),
    );
  }
}
