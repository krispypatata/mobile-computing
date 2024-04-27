import 'package:flutter/material.dart';
import '../models/friend_info.dart';

class FriendListProvider with ChangeNotifier {
  List<FriendInfo> _friendsList = [];

  List<FriendInfo> get friendsList => _friendsList;

  void addFriend(FriendInfo friend) {
    _friendsList.add(friend);
    notifyListeners();
  }

  void removeFriend(FriendInfo friend) {
    _friendsList.remove(friend);
    notifyListeners();
  }
}
