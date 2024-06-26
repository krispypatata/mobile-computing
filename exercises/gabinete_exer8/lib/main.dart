/*
  Name: Gabinete, Keith Ginoel S.
  Student No.: 2020-03670
  Lab Section: CMSC 23 - UV 5L

  Laboratory Exercise #08: Data Persistence
  Date created: April 26, 2024

  Program Description:
      Program Description: 
      This program manages Slambook data, initially presenting an empty friend list. 
      Users can add friends to the list using the Slambook interface. When all details 
      are correct and valid, users can click the button at the lower right of the 
      Slambook interface to add the friend to the list. Additionally, users can click 
      on friend names to view their details. The program also features a drawer for 
      quick access to both the Slambook and the friend list. Enhancing its functionality, 
      the program incorporates CRUD (Create, Read, Update, Delete) operations, facilitating 
      dynamic interaction with the Slambook data. This interactivity is supported by Firebase, 
      ensuring real-time data persistence and a seamless user experience across devices. 
      Moreover, the program utilizes the Provider package for efficient state management.

 */

import 'package:flutter/material.dart';
import 'package:gabinete_exer8/configs/constants.dart';
import 'package:gabinete_exer8/screens/slambook.dart';
import 'package:gabinete_exer8/screens/friends.dart';
import 'package:gabinete_exer8/screens/info_page.dart';
import 'package:provider/provider.dart';
import 'package:gabinete_exer8/providers/friend_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:gabinete_exer8/screens/slambook_edit_friend.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => FriendListProvider())
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Exercise 8',
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
        SlambookUpdate.routeName: (context) => SlambookUpdate(),
      },
      onGenerateRoute: (settings) {
        return null;
      },
    );
  }
}
