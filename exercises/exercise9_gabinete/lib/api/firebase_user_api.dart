import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/user_model.dart';

class FirebaseUserAPI {
  static final FirebaseFirestore db = FirebaseFirestore.instance;

  Future<String> addUserDetails(Map<String, dynamic> user) async {
    try {
      final docRef = await db.collection("users").add(user);
      await db.collection("users").doc(docRef.id).update({'id': docRef.id});

      return "Successfully added a user!";
    } on FirebaseException catch (e) {
      return "Failed with error '${e.code}: ${e.message}";
    }
  }

  Stream<QuerySnapshot> getAllUsers() {
    return db.collection("users").snapshots();
  }

  Future<UserDetails?> getUserByEmail(String email) async {
    try {
      QuerySnapshot querySnapshot = await db
          .collection('users')
          .where('email', isEqualTo: email)
          .limit(1)
          .get();
      if (querySnapshot.docs.isNotEmpty) {
        return UserDetails.fromJson(
            querySnapshot.docs.first.data() as Map<String, dynamic>);
      }
      return null;
    } catch (e) {
      print('Error fetching user by email: $e');
      return null;
    }
  }
}
