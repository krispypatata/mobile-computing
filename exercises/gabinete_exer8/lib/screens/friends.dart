import 'package:flutter/material.dart';
import '../configs/constants.dart';
import '../models/friend_info.dart';
import 'navigation_drawer.dart';
import 'package:provider/provider.dart';
import '../providers/friend_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Friends extends StatefulWidget {
  static const routeName = '/friends';

  const Friends({super.key});

  @override
  _FriendsState createState() => _FriendsState();
}

class _FriendsState extends State<Friends> {
  @override
  Widget build(BuildContext context) {
    Stream<QuerySnapshot> friendsList =
        context.watch<FriendListProvider>().friendsStream;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Friends",
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
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pushNamed(context, '/slambook');
        },
        label: const Text('Add Friend'),
        icon: const Icon(Icons.person, color: Colors.black),
        backgroundColor: floatingButtonColor,
      ),

      // LIST VIEW
      body: Container(
        color: darkBlue,
        child: StreamBuilder(
          stream: friendsList,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text("Error encountered! ${snapshot.error}"),
              );
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasData && snapshot.data!.docs.isEmpty) {
              return const Center(
                child: Text(
                  "No Friends Yet!",
                  style: TextStyle(
                    fontSize: friendsPageFontSize,
                    color: Colors.grey,
                  ),
                ),
              );
            }
            // When data is available, display it in a ListView
            List<DocumentSnapshot> friends = snapshot.data!.docs;
            return ListView.builder(
              itemCount: friends.length,
              itemBuilder: (context, index) {
                FriendInfo friendInfo = FriendInfo.fromJson(
                    friends[index].data() as Map<String, dynamic>);
                friendInfo.id = friends[index].id;
                return ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
                  leading: Container(
                    padding: const EdgeInsets.only(right: 12.0),
                    child: const Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                  ),
                  title: Text(
                    // friends[index]['name'],
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
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () {
                          // edit a friend
                          Navigator.pushNamed(
                            context,
                            '/editfriend',
                            arguments: friendInfo,
                          );
                        },
                        icon: const Icon(
                          Icons.create_outlined,
                          color: Colors.white,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          // delete a friend
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text("Delete Friend"),
                                content: Text(
                                    "Are you sure you want to delete this ${friendInfo.name}?"),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text("Cancel"),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      context
                                          .read<FriendListProvider>()
                                          .deleteFriend(friendInfo.id!);
                                      Navigator.pop(context);
                                    },
                                    child: const Text("Delete"),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        icon: const Icon(
                          Icons.delete_outlined,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
