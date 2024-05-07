import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/user_provider.dart';

class UserDetailsPage extends StatelessWidget {
  const UserDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final userProvider = Provider.of<UserProvider>(context);
    // final userDetails = userProvider.selectedUser;

    // get the selected user from the provider
    final userDetails = context.watch<UserProvider>().selectedUser;

    if (userDetails == null) {
      // User details are still loading, display a loading indicator
      return Scaffold(
        appBar: AppBar(
          title: const Text("Details"),
        ),
        body: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Details"),
      ),
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.only(left: 40.0, right: 40.0),
          children: <Widget>[
            const Text(
              "Details",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 25),
            ),
            Text(
              "Email: ${userDetails.email}",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20),
            ),
            Text(
              "First Name: ${userDetails.firstName}",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20),
            ),
            Text(
              "Last Name: ${userDetails.lastName}",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
