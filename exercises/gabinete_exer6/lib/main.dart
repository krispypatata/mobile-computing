/*
  Name: Gabinete, Keith Ginoel S.
  Student No.: 2020-03670
  Lab Section: CMSC 23 - UV 5L

  Laboratory Exercise #06: State Management
  Date created: April 07, 2024

  Program Description:
      This program is a simple e-commerce application that allows users to 
      add item products to a shopping cart, and proceed to checkout. It starts 
      with a catalog page, where users can add items to their shopping cart from 
      the list of available products. Once all desired products are added, users 
      can navigate to the cart page to review selections and proceed to checkout. 
      At checkout page, users can review the total cost and confirm their purchase. 
      Additionally, the application utilizes the Provider package for effective 
      state management.
 */

import 'package:flutter/material.dart';
import 'package:gabinete_exer6/screen/Checkout.dart';
import 'package:gabinete_exer6/screen/MyCart.dart';
import 'package:gabinete_exer6/screen/MyCatalog.dart';
import 'package:provider/provider.dart';
import 'provider/shoppingcart_provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => ShoppingCart()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        // colorScheme: ThemeData().colorScheme.copyWith(background: Colors.black),
      ),
      initialRoute: "/products",
      routes: {
        "/cart": (context) => const MyCart(),
        "/checkout": (context) => const Checkout(),
        "/products": (context) => const MyCatalog(),
      },
      // home: const MyCatalog(),
    );
  }
}
