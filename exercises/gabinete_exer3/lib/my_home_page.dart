/*
  Name: Gabinete, Keith Ginoel S.
  Student No.: 2020-03670
  Lab Section: CMSC 23 - UV 5L

  Laboratory Exercise #02 : OOP in Dart
  Date created: March 08, 2024

  Program Description:
    This is a straightforward Flutter application that aims to emulate the UI design of an Instagram profile, albeit in a simplified manner.
 */

import 'package:flutter/material.dart';

// define a custom constant color for indigo[100]
const Color indigo100 = Color(0xFFC5CAE9);

class MyHomePage extends StatefulWidget {
  final String title;
  const MyHomePage({super.key, required this.title});
  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // track the number of images/posts in the grid
  int _imagesCounter = 0;
  List<String> imagePaths = [
    "assets/01.jpg",
    "assets/02.jpg",
    "assets/03.png",
    "assets/04.jpg",
    "assets/05.jpg",
    "assets/06.jpg",
    "assets/07.jpg",
    "assets/08.jpg",
    "assets/09.jpg",
    "assets/10.jpg",
    "assets/11.jpg",
    "assets/12.jpg",
    "assets/13.jpg",
    "assets/14.jpg",
    "assets/15.jpeg",
  ];
  @override
  void initState() {
    super.initState();
    // initialize _imagesCounter to the actual number of images
    _imagesCounter = imagePaths.length;
  }

  Widget myGrid(int imageCounter) {
    // update the value of the imageCounter (both in the code and in the UI)
    setState(() {
      _imagesCounter = imagePaths.length;
    });

    // build the GridView
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
      ),
      itemCount: imagePaths.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          // add padding to each card
          padding: const EdgeInsets.all(3.0),
          child: AspectRatio(
            aspectRatio: 1,
            child: ClipRect(
              child: Image.asset(
                imagePaths[index],
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
      backgroundColor: Colors.indigo[100],
      // *******************************************************************************************************************
      // *******************************************************************************************************************
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80.0), // set preferred height
        child: AppBar(
          title: Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(top: 30.0), // adjust top padding
            margin: const EdgeInsets.only(left: 16.0), // adjust the left margin
            child: Text(
              widget.title,
              style: const TextStyle(
                color: indigo100,
                fontSize: 24, // increase font size
                fontWeight: FontWeight.bold, // set text to bold
              ),
            ),
          ),
          backgroundColor: Colors.black,
          centerTitle: true, // center the title vertically
          titleSpacing: 0,
        ),
      ),

      // *******************************************************************************************************************
      // *******************************************************************************************************************
      // body
      body: Column(
        // ROOT NODE
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // ===============================================================================================================
          // ===============================================================================================================
          // child 1 (profile header)
          Container(
            padding: const EdgeInsets.only(top: 10, bottom: 30),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // ---------------------------------------------------------------------------------------------------------
                // avatar (image)
                Flexible(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, top: 20),
                    child: Container(
                      // border
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.black,
                          width: 2.0,
                        ),
                      ),
                      // enclosed the image in a circle
                      child: ClipOval(
                        child: Image.asset(
                          'assets/avatar.jpg',
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                // ---------------------------------------------------------------------------------------------------------
                // BIO TEXT
                Flexible(
                  flex: 2,
                  child: Container(
                    padding: const EdgeInsets.only(top: 20, left: 10),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const Text(
                              "Keith Ginoel\nGabinete",
                              textAlign: TextAlign.left,
                            ),
                            const SizedBox(
                                width: 30), // add spacing between the texts
                            // make "Add Bio" clickable
                            GestureDetector(
                              onTap: () {
                                print("Add Bio clicked!"); // for checking
                              },
                              child: const Text(
                                "Add Bio",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 10),
                          child: Row(
                            children: [
                              Text("$_imagesCounter posts"),
                              const SizedBox(
                                  width: 5), // add spacing between the texts
                              const Text('|'), // divider
                              const SizedBox(
                                  width: 5), // add spacing between the texts
                              const Text("10 following"),
                              const SizedBox(
                                  width: 5), // add spacing between the texts
                              const Text('|'), // divider
                              const SizedBox(
                                  width: 5), // add spacing between the texts
                              const Text("10 followers"),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          // ===============================================================================================================
          // ===============================================================================================================
          // simple divider
          Theme(
            data: ThemeData(
              dividerTheme: DividerThemeData(
                thickness: 1,
                color: Colors.grey.withOpacity(0.5), // change opacity
              ),
            ),
            child: const Divider(height: 0.1),
          ),
          // ===============================================================================================================
          // ===============================================================================================================
          // child 2 (Icons)
          Container(
            padding: const EdgeInsets.only(top: 20, bottom: 25),
            child: const Row(
              children: [
                Spacer(), // space
                // POSTS
                Row(
                  children: [
                    Icon(Icons.tag),
                    SizedBox(width: 8), // space
                    Text('POSTS'),
                  ],
                ),
                Spacer(), // space
                // REELS
                Row(
                  children: [
                    Icon(Icons.video_file),
                    SizedBox(width: 8), // space
                    Text('REELS'),
                  ],
                ),
                Spacer(), // space
                // SAVED
                Row(
                  children: [
                    Icon(Icons.bookmark),
                    SizedBox(width: 8), // space
                    Text('SAVED'),
                  ],
                ),
                Spacer(), // space
                // TAGGED
                Row(
                  children: [
                    Icon(Icons.tag_faces_rounded),
                    SizedBox(width: 8), // space
                    Text('TAGGED'),
                  ],
                ),
                Spacer(), // space
              ],
            ),
          ),
          // ===============================================================================================================
          // ===============================================================================================================
          // child 3 (Floating button)
          Container(
            padding: const EdgeInsets.only(bottom: 10),
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0, bottom: 16.0),
              child: FloatingActionButton(
                shape: const CircleBorder(),
                onPressed: () {
                  // Handle button press
                  print("Add button clicked!");
                },
                tooltip: 'Add', // tooltip
                backgroundColor: Colors.black,
                child: const Icon(Icons.add, color: Colors.white),
              ),
            ),
          ),
          // ===============================================================================================================
          // ===============================================================================================================
          // child 4 (Posts/Images)
          Expanded(
            child: myGrid(_imagesCounter),
          ),
        ],
      ),
    );
  }
}
