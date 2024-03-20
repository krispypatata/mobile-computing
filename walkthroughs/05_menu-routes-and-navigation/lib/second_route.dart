import 'package:flutter/material.dart';

class SecondRoute extends StatelessWidget {
  static const routename = '/second2';
  final String? title;
  final String? message;

  const SecondRoute({super.key, this.title, this.message});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(title!)),
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
              Text(message!),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, "Go back");
                },
                child: const Text('Go back!'),
              ),
            ])));
  }
}
