/*
  Name: Gabinete, Keith Ginoel S.
  Student No.: 2020-03670
  Lab Section: CMSC 23 - UV 5L

  Laboratory Exercise #05: Menu and Navigation
  Date created: March 20, 2024

  Program Description:
      This program manages Slambook data, initially presenting an empty friend list. 
      Users can add friends to the list using the Slambook interface. When all details 
      are correct and valid, users can click the button at the lower right of the Slambook 
      interface to add the friend to the list. Additionally, users can click on friend names 
      to view their details. The program also features a drawer for quick access to both the 
      Slambook and the friend list.

 */

import 'package:flutter/material.dart';
import 'slambook.dart';
import 'friends.dart';
import 'info_page.dart';

const Color darkBlue = Color(0xFF2C2C3D);
const Color darkerBlue = Color(0xFF0B0B1A);
const Color customPurple = Color(0xFF644E9D);
const Color floatingButtonColor = Color(0xFF05d8c2);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exercise 5',
      theme: ThemeData(
        inputDecorationTheme: const InputDecorationTheme(
          floatingLabelStyle: TextStyle(color: customPurple),
          labelStyle: TextStyle(color: Colors.grey),
        ),
      ),
      initialRoute: Friends.routeName,
      routes: {
        Slambook.routeName: (context) => Slambook(),
        Friends.routeName: (context) => Friends(),
        InfoPage.routeName: (context) => InfoPage(),
      },
      onGenerateRoute: (settings) {
        return null;
      },
    );
  }
}

// Drawer widget
class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: darkerBlue,
        child: ListView(
          padding: const EdgeInsets.only(top: 50),
          children: <Widget>[
            ListTile(
              title: const Text(
                'Slambook',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onTap: () {
                Navigator.pushNamed(context, '/slambook');
              },
            ),
            ListTile(
              title: const Text(
                'Friends',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onTap: () {
                Navigator.pushNamed(context, '/friends');
              },
            ),
          ],
        ),
      ),
    );
  }
}
