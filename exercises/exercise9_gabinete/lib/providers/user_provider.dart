import 'package:flutter/material.dart';
import '../api/firebase_user_api.dart'; // Assuming you have created FirebaseUserAPI
import '../models/user_model.dart'; // Assuming you have created UserInfo model
import 'package:cloud_firestore/cloud_firestore.dart';

class UserProvider with ChangeNotifier {
  late FirebaseUserAPI firebaseService;
  late Stream<QuerySnapshot> _usersStream;

  UserDetails? _selectedUser;
  UserDetails? get selectedUser => _selectedUser;

  String _selectedUserEmail = '';
  String get selectedUserEmail => _selectedUserEmail;

  UserProvider() {
    firebaseService = FirebaseUserAPI();
    fetchUsers();
  }

  Stream<QuerySnapshot> get users => _usersStream;
  // UserDetails get selected => _selectedUser!;

  changeSelectedUser(UserDetails? user) {
    _selectedUser = user;
    notifyListeners();
  }

  changeSelectedUserEmail(String email) {
    _selectedUserEmail = email;
    notifyListeners();
  }

  void fetchUsers() {
    _usersStream = firebaseService.getAllUsers();
    notifyListeners();
  }

  void addUser(UserDetails user) async {
    String message = await firebaseService.addUserDetails(user.toJson(user));
    print(message);
    notifyListeners();
  }

  // get user by email
  Future<UserDetails?> getUserByEmail(String email) async {
    UserDetails? user = await firebaseService.getUserByEmail(email);
    return user;
  }

  // change user by email
  changeUserByEmail(String email) async {
    UserDetails? user = await firebaseService.getUserByEmail(email);
    _selectedUser = user;
    notifyListeners();
  }
}
