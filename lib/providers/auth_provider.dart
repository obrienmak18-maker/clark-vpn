import 'package:flutter/material.dart';
import '../models/user_model.dart';
class AuthProvider extends ChangeNotifier {
  User? _currentUser;
  bool _isAuthenticated = false;
  bool _isLoading = false;
  User? get currentUser => _currentUser;
  bool get isAuthenticated => _isAuthenticated;
  bool get isLoading => _isLoading;
  Future<void> checkLoginStatus() async { _isLoading = true; notifyListeners(); await Future.delayed(Duration(seconds: 1)); _isLoading = false; notifyListeners(); }
  Future<bool> login(String e, String p) async { _isAuthenticated = true; notifyListeners(); return true; }
  Future<void> logout() async { _isAuthenticated = false; notifyListeners(); }
}
