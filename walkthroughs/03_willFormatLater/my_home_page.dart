import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  final String title;
  MyHomePage({super.key, required this.title});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  Widget myGrid() {
    List<String> subjects = [
      "CMSC 12",
      "CMSC 21",
      "CMSC 22",
      "CMSC 23",
      "CMSC 100"
    ];
    return GridView.builder(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemCount: subjects.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            color: Colors.pink,
            child: Center(child: Text("${subjects[index]}")),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: myGrid(),
      ),
    );
  }
}
