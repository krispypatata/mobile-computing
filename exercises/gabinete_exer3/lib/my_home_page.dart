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
    List<String> imagePaths = [
      "assets/01.jpg",
      "assets/02.jpeg",
      "assets/03.png",
      "assets/04.jpg"
    ];

    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
      ),
      itemCount: imagePaths.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(3.0), // Add padding to each card
          child: AspectRatio(
            aspectRatio: 1, // Adjust this ratio as per your requirement
            child: ClipRect(
              child: Image.asset(
                imagePaths[index], // Path to the image
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
      },
    );
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
                Transform.translate(
                  offset:
                      Offset(50, -70), // Adjust the vertical offset as needed
                  child: ClipOval(
                    child: Image.asset(
                      'assets/avatar.jpg', // Provide the path to your image asset
                      width: 100, // Adjust the width as needed
                      height: 100, // Adjust the height as needed
                      fit: BoxFit
                          .cover, // Ensure the entire image is visible within the circular clipping
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 50, left: 60), // Adjust the left padding for spacing
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start, // Align the text to the start
                    children: [
                      Row(
                        children: [
                          Text(
                            "Keith Ginoel\nGabinete",
                            textAlign: TextAlign.left, // Align text to the left
                          ),
                          SizedBox(width: 30), // Add spacing between the texts
                          Text(
                            "Add Bio",
                            textAlign: TextAlign.left, // Align text to the left
                            style: TextStyle(
                              color: Colors
                                  .blue, // Change color to your desired color
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
                    ],
                  ),
                ),
              ],
            ),
          ),

          // child 2 (Icons)

          Row(
            children: [
              Spacer(), // Add Spacer to evenly distribute
              // POSTS
              Row(
                children: [
                  Icon(Icons.tag), // Your icon
                  SizedBox(width: 8), // Space between icon and text
                  Text('POSTS'), // Your text
                ],
              ),
              Spacer(), // Add Spacer to evenly distribute
              // REELS
              Row(
                children: [
                  Icon(Icons.video_file), // Your icon
                  SizedBox(width: 8), // Space between icon and text
                  Text('REELS'), // Your text
                ],
              ),
              Spacer(), // Add Spacer to evenly distribute
              // SAVED
              Row(
                children: [
                  Icon(Icons.bookmark), // Your icon
                  SizedBox(width: 8), // Space between icon and text
                  Text('SAVED'), // Your text
                ],
              ),
              Spacer(), // Add Spacer to evenly distribute
              // TAGGED
              Row(
                children: [
                  Icon(Icons.tag_faces_rounded), // Your icon
                  SizedBox(width: 8), // Space between icon and text
                  Text('TAGGED'), // Your text
                ],
              ),
              Spacer(), // Add Spacer to evenly distribute
            ],
          ),

          // child 3 (Floating button)

          // child 3 (Floating button)
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0, bottom: 16.0),
              child: FloatingActionButton(
                onPressed: () {
                  // Handle button press
                },
                tooltip: 'Add', // Tooltip for the button
                backgroundColor: Colors.cyan,
                child: Icon(Icons.add), // Icon for the button
              ),
            ),
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
