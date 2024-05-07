import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/user_provider.dart';
import '../utils/globals.dart' as globals;

class UserDetailsPage extends StatelessWidget {
  const UserDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final userProvider = Provider.of<UserProvider>(context);
    // final userDetails = userProvider.selectedUser;

    // get the selected user from the provider
    // final userDetails = context.watch<UserProvider>().selectedUser;

    // var currentUserEmail = context.watch<UserProvider>().selectedUserEmail;
    context
        .read<UserProvider>()
        .changeUserByEmail(globals.currentLoggedInUserEmail);
    var userDetails = context.watch<UserProvider>().selectedUser;
    // print("USSSSSSSSSSSERRRRRRRRRRRRRRRR");
    // print(currentUserEmail);
    // print(userDetails!.email);

    if (userDetails == null ||
        userDetails.email != globals.currentLoggedInUserEmail) {
      // User details are still loading, display a loading indicator
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Details",
          ),
        ),
        body: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Details",
        ),
      ),
      body: Stack(
        children: [
          Center(
            child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.only(left: 40.0, right: 40.0),
              children: <Widget>[
                const Text(
                  "Details",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.cyan,
                  ),
                ),
                Text(
                  "Email: ${userDetails.email}",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xFF006064),
                  ),
                ),
                Text(
                  "First Name: ${userDetails.firstName}",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xFF006064),
                  ),
                ),
                Text(
                  "Last Name: ${userDetails.lastName}",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xFF006064),
                  ),
                ),
              ],
            ),
          ),
          CustomBoxDecoration(top: 125, left: 45),
          CustomBoxDecoration(top: 75, left: 100),
          CustomBoxDecoration(top: 150, left: 175),
          CustomBoxDecoration(top: 85, left: 250),

          // bottom decoration
          CustomBoxDecoration(top: 555, left: 45),
          CustomBoxDecoration(top: 605, left: 100),
          CustomBoxDecoration(top: 535, left: 175),
          CustomBoxDecoration(top: 600, left: 250),
        ],
      ),
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
        color: Color(0xFF006064),
        width: 100,
        height: 100,
      ),
    );
  }
}
