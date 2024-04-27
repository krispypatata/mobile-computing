import 'package:flutter/material.dart';
import '../configs/constants.dart';
import '../models/friend_info.dart';
import 'navigation_drawer.dart';
import 'package:provider/provider.dart';
import '../providers/friend_provider.dart';

class Friends extends StatefulWidget {
  static const routeName = '/friends';

  const Friends({super.key});

  @override
  _FriendsState createState() => _FriendsState();
}

class _FriendsState extends State<Friends> {
  @override
  Widget build(BuildContext context) {
    // list of FriendInfo objects, retrieved from the provider
    List<FriendInfo> friendsList =
        context.watch<FriendListProvider>().friendsList;

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
              mainAxisAlignment: friendsList.isEmpty
                  ? MainAxisAlignment.center
                  : MainAxisAlignment.start,
              children: [
                Visibility(
                  visible: friendsList.isEmpty,
                  child: const Padding(
                    padding:
                        EdgeInsets.only(bottom: 0), // Adjust bottom padding
                    child: Text(
                      "No Friends Yet!",
                      style: TextStyle(
                        fontSize: friendsPageFontSize,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                Visibility(
                  visible: friendsList.isNotEmpty,
                  child: ListView.builder(
                    shrinkWrap: true,
                    // Important: Remove any padding from the ListView.
                    padding: EdgeInsets.zero,
                    itemCount: friendsList.length,
                    itemBuilder: (BuildContext context, int index) {
                      final friendInfo = friendsList[index];
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
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              onPressed: () {
                                // showDialog(
                                //   context: context,
                                //   builder: (BuildContext context) => TodoModal(
                                //     type: 'Edit',
                                //     item: todo,
                                //   ),
                                // );
                              },
                              icon: const Icon(
                                Icons.create_outlined,
                                color: Colors.white,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                // showDialog(
                                //   context: context,
                                //   builder: (BuildContext context) =>
                                //       TodoModal(type: 'Delete', item: todo),
                                // );
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
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.pushNamed(context, '/slambook');
          },
          label: const Text('Add Friend'),
          icon: const Icon(Icons.person, color: Colors.black),
          backgroundColor: floatingButtonColor,
        ));
  }
}
