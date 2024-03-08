import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  final String title;
  MyHomePage({super.key, required this.title});
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // track the number of images/posts in the grid
  int _imagesCounter = 0;

  Widget myGrid(int imageCounter) {
    List<String> imagePaths = [
      "assets/01.jpg",
      "assets/02.jpeg",
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
    ];

    // update the value of the imageCounter (both in the code and in the UI)
    _imagesCounter = imagePaths.length;
    setState(() {
      _imagesCounter = imagePaths.length;
    });

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
                color: Colors.white,
                fontSize: 24, // cncrease font size
                fontWeight: FontWeight.bold, // set text to bold
              ),
            ),
          ),
          backgroundColor: Colors.black,
          centerTitle: true, // Center the title vertically
          titleSpacing: 0, // Set titleSpacing to 0
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
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.black, // Set border color
                          width: 2.0, // Set border width
                        ),
                      ),
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
                        const Row(
                          children: [
                            Text(
                              "Keith Ginoel\nGabinete",
                              textAlign:
                                  TextAlign.left, // Align text to the left
                            ),
                            SizedBox(
                                width: 30), // Add spacing between the texts
                            Text(
                              "Add Bio",
                              textAlign:
                                  TextAlign.left, // Align text to the left
                              style: TextStyle(
                                color: Colors
                                    .blue, // Change color to your desired color
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
                thickness: 1, // Change thickness as desired
                color: Colors.grey.withOpacity(0.5), // Change opacity
              ),
            ),
            child: const Divider(height: 0.1), // Set height as desired
          ),
          // ===============================================================================================================
          // ===============================================================================================================
          // child 2 (Icons)
          Container(
            padding: const EdgeInsets.only(top: 20, bottom: 25),
            child: const Row(
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
                },
                tooltip: 'Add', // Tooltip for the button
                backgroundColor: Colors.black,
                child: const Icon(Icons.add,
                    color: Colors.white), // Icon for the button
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
