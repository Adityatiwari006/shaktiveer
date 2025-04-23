import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AppState extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? _user;

  User? get user => _user;

  // Initializing the app state
  AppState() {
    _auth.authStateChanges().listen((user) {
      _user = user;
      notifyListeners();
    });
  }

  // Login logic
  Future<void> login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      Fluttertoast.showToast(msg: "Login Successful", backgroundColor: Colors.green);
    } catch (e) {
      Fluttertoast.showToast(msg: "Login Failed: $e", backgroundColor: Colors.red);
    }
  }

  // Signup logic
  Future<void> signup(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      Fluttertoast.showToast(msg: "Signup Successful", backgroundColor: Colors.green);
    } catch (e) {
      Fluttertoast.showToast(msg: "Signup Failed: $e", backgroundColor: Colors.red);
    }
  }

  // Logout logic
  Future<void> logout() async {
    await _auth.signOut();
    Fluttertoast.showToast(msg: "Logged out", backgroundColor: Colors.blue);
  }
}
