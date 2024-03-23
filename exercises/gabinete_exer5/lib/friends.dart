import 'package:flutter/material.dart';
import 'main.dart';
import 'friend_info.dart';

class Friends extends StatefulWidget {
  static const routeName = '/friends';

  // list of FriendInfo objects, initially empty
  static List<FriendInfo> friendsList = [];

  const Friends({super.key});

  @override
  _FriendsState createState() => _FriendsState();
}

class _FriendsState extends State<Friends> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Friends Page",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            )),
        backgroundColor: darkerBlue,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu, color: Colors.white),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        // centerTitle: true, // center title vertically
      ),
      drawer: AppDrawer(),
      body: Container(
        color: darkBlue,
        child: Center(
          child: Column(
            mainAxisAlignment: Friends.friendsList.isEmpty
                ? MainAxisAlignment.center
                : MainAxisAlignment.start,
            children: [
              Visibility(
                visible: Friends.friendsList.isEmpty,
                child: const Padding(
                  padding: EdgeInsets.only(bottom: 0), // Adjust bottom padding
                  child: Text(
                    "No Friends Yet!",
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: Friends.friendsList.isNotEmpty,
                child: ListView.builder(
                  shrinkWrap: true,
                  // Important: Remove any padding from the ListView.
                  padding: EdgeInsets.zero,
                  itemCount: Friends.friendsList.length,
                  itemBuilder: (BuildContext context, int index) {
                    final friendInfo = Friends.friendsList[index];
                    return ListTile(
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 20.0),
                      leading: Container(
                        padding: const EdgeInsets.only(right: 12.0),
                        child: const Icon(
                          Icons.person,
                          color: Colors.white,
                        ),
                      ),
                      title: Text(
                        friendInfo.name,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          '/infopage',
                          arguments: friendInfo,
                        );
                      },
                    );
                  },
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/slambook');
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(0),
                    child: Text(
                      'Go to Slambook!',
                      style: TextStyle(
                        color: customPurple,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
