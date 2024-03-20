import 'package:flutter/material.dart';
import 'ScreenArguments.dart';
import 'second_route.dart';

class FirstRoute extends StatefulWidget {
  const FirstRoute({super.key});

  @override
  State<FirstRoute> createState() => _FirstRouteState();
}

class _FirstRouteState extends State<FirstRoute> {
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Route'),
      ),
      body: Center(
          child: Column(children: [
        TextFormField(
          controller: _controller,
          decoration: const InputDecoration(
              icon: Icon(Icons.person),
              hintText: "Enter name: ",
              labelText: "Name"),
        ),
        ElevatedButton(
          child: const Text('Send to Second route'),
          onPressed: () async {
            final result = await Navigator.pushNamed(
                context, SecondRoute.routename,
                arguments: ScreenArguments(
                    title: "This is a title", message: _controller.text));
            ScaffoldMessenger.of(context)
              ..removeCurrentSnackBar()
              ..showSnackBar(SnackBar(content: Text('$result')));
          },
        ),
      ])),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: const Text('Second Screen'),
              onTap: () {
                // Update the state of the app.
                // ...copy paste here the navigator.push method here
                //you may navigate to SecondScreen
                Navigator.pushNamed(context, SecondRoute.routename,
                    arguments: ScreenArguments(
                        title: "This is a title", message: _controller.text));
              },
            ),
            ListTile(
              title: const Text('Passed Argument'),
              onTap: () {
                Navigator.pop(context);
                // Update the state of the app
                // ...
                // Then close the drawer
              },
            ),
          ],
        ),
      ),
    );
  }
}
