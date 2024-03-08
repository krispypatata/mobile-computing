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
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.0), // set preferred height
        child: AppBar(
          title: Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(top: 30.0), // adjust top padding
            margin: EdgeInsets.only(left: 16.0), // adjust the left margin
            child: Text(
              widget.title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 24, // cncrease font size
                fontWeight: FontWeight.bold, // set text to bold
              ),
            ),
          ),
          backgroundColor: Colors.blue,
          centerTitle: true, // Center the title vertically
          titleSpacing: 0, // Set titleSpacing to 0
        ),
      ),

      // body
      body: Column(
        // ROOT NODE

        mainAxisAlignment: MainAxisAlignment.center,

        children: <Widget>[
          // child 1 (profile header)
          Expanded(
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/avatar.jpg', // Provide the path to your image asset
                  width: 100, // Adjust the width as needed
                  height: 100, // Adjust the height as needed
                ),
                Column(children: [
                  Row(
                    children: [
                      Text("Keith Ginoel Gabinete"),
                      Text(
                        "Add Bio",
                        style: TextStyle(
                          color:
                              Colors.blue, // Change color to your desired color
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text("4 posts"),
                      Text("10 following"),
                      Text("10 followers"),
                    ],
                  ),
                ]),
              ],
            ),
          ),

          // child 2 (Icons)
          const Expanded(
            child: Row(
              children: [
                // POSTS
                Row(
                  children: [
                    Icon(Icons.tag), // Your icon
                    SizedBox(width: 8), // Space between icon and text
                    Text('POSTS'), // Your text
                  ],
                ),

                // REELS
                Row(
                  children: [
                    Icon(Icons.video_file), // Your icon
                    SizedBox(width: 8), // Space between icon and text
                    Text('REELS'), // Your text
                  ],
                ),

                // SAVED
                Row(
                  children: [
                    Icon(Icons.bookmark), // Your icon
                    SizedBox(width: 8), // Space between icon and text
                    Text('SAVED'), // Your text
                  ],
                ),

                // TAGGED
                Row(
                  children: [
                    Icon(Icons.tag_faces_rounded), // Your icon
                    SizedBox(width: 8), // Space between icon and text
                    Text('TAGGED'), // Your text
                  ],
                ),
              ],
            ),
          ),

          // child 3 (Floating button)

          // child 3 (Floating button)
          FloatingActionButton(
            onPressed: () {
              // Handle button press
            },
            tooltip: 'Add', // Tooltip for the button
            backgroundColor: Colors.cyan,
            child: Icon(Icons.add), // Icon for the button
          ),

          // child 4 (Posts/Images)
          Expanded(
            child: myGrid(),
          ),
        ],
      ),
    );
  }
}
