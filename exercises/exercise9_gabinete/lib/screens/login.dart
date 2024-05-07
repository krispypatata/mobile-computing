import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';
import '../screens/signup.dart';
import '../providers/user_provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // dispose controllers
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  // error messages
  String? emailError;
  String? passwordError;

  @override
  Widget build(BuildContext context) {
    final email = TextFormField(
      key: const Key('emailField'),
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
          borderSide: const BorderSide(color: Colors.cyan, width: 2),
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
      key: const Key('pwField'),
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
        else if (value.length < 6) {
          return 'Password must be at least 6 characters';
        }
        return null;
      },
    );

    final loginButton = Padding(
      key: const Key('loginButton'),
      padding: const EdgeInsets.only(top: 16, bottom: 10),
      child: ElevatedButton(
        onPressed: () async {
          // reset error messages
          setState(() {
            emailError = null;
            passwordError = null;
          });
          if (_formKey.currentState!.validate()) {
            String? error = await context.read<AuthProvider>().signIn(
                  emailController.text.trim(),
                  passwordController.text.trim(),
                );
            if (error != null) {
              if (error.contains('email')) {
                setState(() {
                  emailError = error;
                });
              } else if (error.contains('password')) {
                setState(() {
                  emailError = null;
                  passwordError = error;
                });
              }
            } else {
              // update the selected user on user provider
              context
                  .read<UserProvider>()
                  .changeUserByEmail(emailController.text.trim());
              // change selectedUserEmail
              // await context
              //     .read<UserProvider>()
              //     .changeSelectedUserEmail(emailController.text.trim());

              // check the selected user email
              // print(
              //     "Selected user email: ${context.read<UserProvider>().selectedUserEmail}");
            }
          }
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
            Colors.cyan.shade700,
          ),
        ),
        child: const Text('Log In', style: TextStyle(color: Colors.black)),
      ),
    );

    final signUpButton = Padding(
      key: const Key('signUpButton'),
      // padding: const EdgeInsets.symmetric(vertical: 16.0),
      padding: const EdgeInsets.only(top: 0),
      child: ElevatedButton(
        onPressed: () async {
          Navigator.of(context).push(
            // MaterialPageRoute(
            //   builder: (context) => const SignupPage(),
            // ),
            PageRouteBuilder(
              opaque: true, // Set opaque to true to remove animation
              pageBuilder: (context, animation, secondaryAnimation) =>
                  const SignupPage(),
            ),
          );
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
            Colors.cyan.shade700, // Change button color to somewhat yellow
          ),
        ),
        child: const Text('Sign Up', style: TextStyle(color: Colors.black)),
      ),
    );

    return Scaffold(
      // create the login form
      body: Form(
        key: _formKey,
        child: Center(
          child: ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.only(left: 40.0, right: 40.0),
            children: <Widget>[
              const Text(
                "Login",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25, color: Colors.cyan),
              ),
              email,
              password,
              loginButton,
              signUpButton,
            ],
          ),
        ),
      ),
    );
  }
}
