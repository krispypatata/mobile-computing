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
        title: Text("Stateful Widget"),
      ),
      body: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Text('You have pushed the button this many times: '),
              ),
              Expanded(
                child: Text('$_counter',
                    style: Theme.of(context).textTheme.headline4),
              ),
            ],
          ),
          Text('You have pushed the button this many times: '),
          Text('$_counter', style: Theme.of(context).textTheme.displayLarge),
          Expanded(
            child: myGrid(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'Increment',
          child: Icon(Icons.add)),
    );
  }
}
