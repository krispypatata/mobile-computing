import 'package:flutter/material.dart';
import 'button_sample.dart';
import 'input_field_sample.dart';
import 'form.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text("Interactivity Sample"),
        ),
        body: ListView(
          children: [
            ButtonSample(),
            InputFieldsSample(),
            FormSample(),
            FormSample(),
          ],
        ),
      ),
    );
  }
}
