import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseFriendAPI {
  static final FirebaseFirestore db = FirebaseFirestore.instance;

  Future<String> addFriend(Map<String, dynamic> friend) async {
    try {
      await db.collection("friends").add(friend);

      return "Successfully added a friend!";
    } on FirebaseException catch (e) {
      return "Failed with error '${e.code}: ${e.message}";
    }
  }

  Stream<QuerySnapshot> getAllFriends() {
    return db.collection("friends").snapshots();
  }

  Future<String> deleteFriend(String? id) async {
    try {
      await db.collection("friends").doc(id).delete();

      return "Successfully deleted a friend!";
    } on FirebaseException catch (e) {
      return "Failed with error '${e.code}: ${e.message}";
    }
  }

  Future<String> editFriend(
    String? id,
    String newNickname,
    int newAge,
    bool newIsInRelationship,
    double newHappinessLevel,
    String newSuperpower,
    String newMotto,
  ) async {
    try {
      await db.collection("friends").doc(id).update({"nickName": newNickname});
      await db.collection("friends").doc(id).update({"age": newAge});
      await db
          .collection("friends")
          .doc(id)
          .update({"isInRelationship": newIsInRelationship});
      await db
          .collection("friends")
          .doc(id)
          .update({"happinessLevel": newHappinessLevel});
      await db
          .collection("friends")
          .doc(id)
          .update({"superpower": newSuperpower});
      await db.collection("friends").doc(id).update({"motto": newMotto});

      return "Successfully edited friend's details!";
    } on FirebaseException catch (e) {
      return "Failed with error '${e.code}: ${e.message}";
    }
  }

  Future<String> toggleStatus(String? id, bool status) async {
    try {
      await db.collection("friends").doc(id).update({"completed": status});

      return "Successfully edited friend's details!";
    } on FirebaseException catch (e) {
      return "Failed with error '${e.code}: ${e.message}";
    }
  }
}
