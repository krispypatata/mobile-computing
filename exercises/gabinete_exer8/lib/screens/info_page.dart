import 'package:flutter/material.dart';
import '../configs/constants.dart';
import '../models/friend_info.dart';

class InfoPage extends StatefulWidget {
  static const routeName = '/infopage';

  const InfoPage({super.key});

  @override
  _InfoPageState createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  @override
  Widget build(BuildContext context) {
    // extract passed arguments
    final friendInfo = ModalRoute.of(context)!.settings.arguments as FriendInfo;
    return Scaffold(
      body: Container(
        color: darkBlue,
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // child 1: icon
                  const Padding(
                    padding: EdgeInsets.only(bottom: 15),
                    child: Icon(
                      Icons.person,
                      color: Colors.white,
                      size: 80,
                    ),
                  ),
                  // child 2: friend details
                  Padding(
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white54,
                        borderRadius:
                            BorderRadius.circular(10), // border radius
                      ),
                      child: Column(
                        children: [
                          DisplaySummary(friendInfo: friendInfo),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20), // add blank space
                  // child 3: back button
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                    ),
                    child: const Text(
                      'Back',
                      style: TextStyle(
                        color: customPurple,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // top decoration
            CustomBoxDecoration(top: 125, left: 45),
            CustomBoxDecoration(top: 75, left: 100),
            CustomBoxDecoration(top: 150, left: 175),
            CustomBoxDecoration(top: 85, left: 250),

            // bottom decoration
            CustomBoxDecoration(top: 655, left: 45),
            CustomBoxDecoration(top: 705, left: 100),
            CustomBoxDecoration(top: 635, left: 175),
            CustomBoxDecoration(top: 700, left: 250),
          ],
        ),
      ),
    );
  }
}

class DisplaySummary extends StatelessWidget {
  final FriendInfo friendInfo;

  const DisplaySummary({Key? key, required this.friendInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // customizations
    const leftTextColor = darkerBlue;
    const rightTextColor = darkerBlue;

    return Padding(
      padding: const EdgeInsets.only(top: 15, bottom: 15, left: 15, right: 15),
      child: Column(children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Expanded(
                  child: Text(
                    "Name",
                    style: TextStyle(
                      color: leftTextColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    friendInfo.name,
                    style: const TextStyle(
                      color: rightTextColor,
                      fontStyle: FontStyle.italic,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
            // 2
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Expanded(
                  child: Text(
                    "Nickname",
                    style: TextStyle(
                      color: leftTextColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    friendInfo.nickname,
                    style: const TextStyle(
                      color: rightTextColor,
                      fontStyle: FontStyle.italic,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
            // 3
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Expanded(
                  child: Text(
                    "Age",
                    style: TextStyle(
                      color: leftTextColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    friendInfo.age,
                    style: const TextStyle(
                      color: rightTextColor,
                      fontStyle: FontStyle.italic,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
            // 4
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Expanded(
                  child: Text(
                    "Is in a Relationship",
                    style: TextStyle(
                      color: leftTextColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    friendInfo.isInRelationship.toString(),
                    style: const TextStyle(
                      color: rightTextColor,
                      fontStyle: FontStyle.italic,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
            // 5
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Expanded(
                  child: Text(
                    "Happiness",
                    style: TextStyle(
                      color: leftTextColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    friendInfo.happinessLevel.toString(),
                    style: const TextStyle(
                      color: rightTextColor,
                      fontStyle: FontStyle.italic,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
            // 6
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Expanded(
                  child: Text(
                    "Super Power",
                    style: TextStyle(
                      color: leftTextColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    friendInfo.superpower,
                    style: const TextStyle(
                      color: rightTextColor,
                      fontStyle: FontStyle.italic,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
            // 7
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Expanded(
                  child: Text(
                    "Motto in Life",
                    style: TextStyle(
                      color: leftTextColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    friendInfo.motto,
                    style: const TextStyle(
                      color: rightTextColor,
                      fontStyle: FontStyle.italic,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ]),
    );
  }
}

class CustomBoxDecoration extends StatelessWidget {
  final double top;
  final double left;

  CustomBoxDecoration({
    required this.top,
    required this.left,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      left: left,
      child: Container(
        color: Colors.white54,
        width: 100,
        height: 100,
      ),
    );
  }
}
