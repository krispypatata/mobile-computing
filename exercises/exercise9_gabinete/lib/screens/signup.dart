import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';
import '../providers/user_provider.dart';
import '../models/user_model.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // dispose controllers
  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  // error messages
  String? firstNameError;
  String? lastNameError;
  String? emailError;
  String? passwordError;

  @override
  Widget build(BuildContext context) {
    final firstName = TextFormField(
      controller: firstNameController,
      decoration: InputDecoration(
        hintText: "First Name",
        hintStyle: const TextStyle(color: Color(0xFF006064)),
        errorText: firstNameError,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
              color: firstNameError != null ? Colors.red : Color(0xFF006064)),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.cyan, width: 2),
        ),
      ),
      style: const TextStyle(color: Color.fromARGB(255, 21, 172, 177)),
      validator: (value) {
        // check if the first name field is empty
        if (value == null || value.isEmpty) {
          return 'First Name is required';
        }
        return null;
      },
    );

    final lastName = TextFormField(
      controller: lastNameController,
      decoration: InputDecoration(
        hintText: "Last Name",
        hintStyle: const TextStyle(color: Color(0xFF006064)),
        errorText: lastNameError,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
              color: lastNameError != null ? Colors.red : Color(0xFF006064)),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.cyan, width: 2),
        ),
      ),
      style: const TextStyle(color: Color.fromARGB(255, 21, 172, 177)),
      validator: (value) {
        // check if the last name field is empty
        if (value == null || value.isEmpty) {
          return 'Last Name is required';
        }
        return null;
      },
    );

    final email = TextFormField(
      controller: emailController,
      decoration: InputDecoration(
        hintText: "Email",
        hintStyle: const TextStyle(color: Color(0xFF006064)),
        errorText: emailError,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
              color: emailError != null ? Colors.red : Color(0xFF006064)),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.cyan, width: 2),
        ),
      ),
      style: const TextStyle(color: Color.fromARGB(255, 21, 172, 177)),
      validator: (value) {
        // regex to validate email
        // String validEmail =
        //     r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?";
        // String validEmail = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$'; // better
        // check if the email field is empty
        if (value == null || value.isEmpty) {
          return 'Email is required';
        }
        // check if the email is valid using regex
        // reference: https://stackoverflow.com/questions/16800540/how-should-i-check-if-the-input-is-an-email-address-in-flutter
        // else if (!RegExp(validEmail).hasMatch(value)) {
        //   return 'Enter a valid email';
        // }
        return null;
      },
    );

    final password = TextFormField(
      controller: passwordController,
      obscureText: true,
      decoration: InputDecoration(
        hintText: "Password",
        hintStyle: const TextStyle(color: Color(0xFF006064)),
        errorText: passwordError,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
              color: passwordError != null ? Colors.red : Color(0xFF006064)),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.cyan, width: 2),
        ),
      ),
      style: const TextStyle(color: Color.fromARGB(255, 21, 172, 177)),
      validator: (value) {
        // check if the password field is empty
        if (value == null || value.isEmpty) {
          return 'Password is required';
        }
        // check if the password is at least 6 characters
        // else if (value.length < 6) {
        //   return 'Password must be at least 6 characters';
        // }
        return null;
      },
    );

    final SignupButton = Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 10),
      child: ElevatedButton(
        onPressed: () async {
          // reset error messages
          setState(() {
            firstNameError = null;
            lastNameError = null;
            emailError = null;
            passwordError = null;
          });
          if (_formKey.currentState!.validate()) {
            // If the form is valid, proceed with sign up
            String? error = await context
                .read<AuthProvider>()
                .signUp(emailController.text, passwordController.text);

            if (error != null) {
              if (error.contains('email')) {
                setState(() {
                  emailError = error;
                });
              } else if (error.contains('Password')) {
                setState(() {
                  passwordError = error;
                });
              }
            }
            // sign up successful
            // If sign up successful, add user to Firestore
            UserDetails newUser = UserDetails(
                email: emailController.text,
                firstName: firstNameController.text,
                lastName: lastNameController.text);
            context.read<UserProvider>().addUser(newUser);

            // change selected email
            // context.read<UserProvider>().changeSelectedUserEmail(newUser.email);

            // change the selected user to the new user
            context.read<UserProvider>().changeSelectedUser(newUser);
            // print email of the selected user
            print("Selected user email: ");
            print(context.read<UserProvider>().selectedUser!.email);

            // close the sign up page
            if (context.mounted) Navigator.pop(context, null);
          }
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
            Colors.cyan.shade700,
          ),
        ),
        child: const Text('Sign up', style: TextStyle(color: Colors.black)),
      ),
    );

    final backButton = Padding(
      padding: const EdgeInsets.only(top: 0),
      child: ElevatedButton(
        onPressed: () {
          Navigator.pop(context, null);
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
            Colors.cyan.shade700,
          ),
        ),
        child: const Text('Back', style: TextStyle(color: Colors.black)),
      ),
    );

    return Scaffold(
      body: Form(
        key: _formKey,
        child: Center(
          child: ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.only(left: 40.0, right: 40.0),
            children: <Widget>[
              const Text(
                "Sign Up",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25, color: Colors.cyan),
              ),
              firstName,
              lastName,
              email,
              password,
              SignupButton,
              backButton
            ],
          ),
        ),
      ),
    );
  }
}
