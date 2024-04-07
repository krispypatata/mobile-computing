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
