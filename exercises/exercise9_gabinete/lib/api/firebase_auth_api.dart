import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthAPI {
  static final FirebaseAuth auth = FirebaseAuth.instance;

  Stream<User?> getUser() {
    return auth.authStateChanges();
  }

  Future<String?> signIn(String email, String password) async {
    try {
      final credential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      //let's print the object returned by signInWithEmailAndPassword
      //you can use this object to get the user's id, email, etc.
      print(credential);
      return null; // return null if there's no error
    } on FirebaseAuthException catch (e) {
      // print('FirebaseAuthException caught: ${e.code}, ${e.message}');
      // email should be valid
      if (e.code == 'invalid-email') {
        return 'Invalid email provided.';
      } else if (e.code == 'user-not-found') {
        // possible to return something more useful
        // than just print an error message to improve UI/UX
        return 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        return 'Wrong password provided for that user.';
      }
    } catch (e) {
      print(e);
      return 'An unknown error occurred.';
    }
  }

  Future<String?> signUp(String email, String password) async {
    UserCredential credential;
    try {
      credential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      //let's print the object returned by signInWithEmailAndPassword
      //you can use this object to get the user's id, email, etc.\
      print(credential);
    } on FirebaseAuthException catch (e) {
      print('FirebaseAuthException caught: ${e.code}, ${e.message}');
      //possible to return something more useful
      //than just print an error message to improve UI/UX
      if (e.code == 'invalid-email') {
        return 'Invalid email provided.';
      } else if (e.code == 'weak-password') {
        return 'Too weak! Password should be at least 6 characters';
      } else if (e.code == 'email-already-in-use') {
        return 'The account already exists for that email.';
      }
    } catch (e) {
      print(e);
      return 'An unknown error occurred.';
    }
  }

  Future<void> signOut() async {
    auth.signOut();
  }
}
