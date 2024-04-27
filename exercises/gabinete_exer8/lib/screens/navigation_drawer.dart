import 'package:flutter/material.dart';
import '../configs/constants.dart';

// Drawer widget
class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: darkerBlue,
        child: ListView(
          padding: const EdgeInsets.only(top: 50),
          children: <Widget>[
            ListTile(
              title: const Text(
                'Slambook',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onTap: () {
                Navigator.pushNamed(context, '/slambook');
              },
            ),
            ListTile(
              title: const Text(
                'Friends',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onTap: () {
                Navigator.popUntil(context, ModalRoute.withName('/friends'));
                // Navigator.pushNamed(context, '/friends');
                // Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
