import 'package:flutter/material.dart';
import '../models/friend_info.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../api/firebase_friends_api.dart';

class FriendListProvider with ChangeNotifier {
  // start of Firebase API
  late FirebaseFriendAPI firebaseService;
  late Stream<QuerySnapshot> _friendsStream;

  FriendListProvider() {
    firebaseService = FirebaseFriendAPI();
    fetchFriends();
  }

  // getter
  Stream<QuerySnapshot> get friendsStream => _friendsStream;

  fetchFriends() {
    _friendsStream = firebaseService.getAllFriends();
    notifyListeners();
  }

  void addFriend(FriendInfo item) async {
    String message = await firebaseService.addFriend(item.toJson(item));
    print(message);

    notifyListeners();
  }

  void editFriend(
    String id,
    String newNickname,
    int newAge,
    bool newIsInRelationship,
    double newHappinessLevel,
    String newSuperpower,
    String newMotto,
  ) async {
    String message = await firebaseService.editFriend(
      id,
      newNickname,
      newAge,
      newIsInRelationship,
      newHappinessLevel,
      newSuperpower,
      newMotto,
    );
    print(message);
    notifyListeners();
  }

  void deleteFriend(String id) async {
    String message = await firebaseService.deleteFriend(id);
    print(message);
    notifyListeners();
  }

  void toggleStatus(String id, bool status) async {
    String message = await firebaseService.toggleStatus(id, status);
    notifyListeners();
  }
}
