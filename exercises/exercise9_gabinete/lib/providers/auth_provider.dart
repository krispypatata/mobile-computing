import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../api/firebase_auth_api.dart';

class AuthProvider with ChangeNotifier {
  late FirebaseAuthAPI authService;

  late Stream<User?> uStream;
  User? userObj;

  AuthProvider() {
    authService = FirebaseAuthAPI();
    fetchAuthentication();
  }

  Stream<User?> get userStream => uStream;

  void fetchAuthentication() {
    uStream = authService.getUser();

    notifyListeners();
  }

  Future<String?> signUp(String email, String password) async {
    String? error = await authService.signUp(email, password);
    notifyListeners();
    return error;
  }

  Future<String?> signIn(String email, String password) async {
    String? error = await authService.signIn(email, password);
    notifyListeners();
    return error;
  }

  Future<void> signOut() async {
    await authService.signOut();
    notifyListeners();
  }
}
