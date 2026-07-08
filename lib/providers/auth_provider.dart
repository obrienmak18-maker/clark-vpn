import 'package:flutter/material.dart';
import 'package:clark_vpn/services/auth_service.dart';
import 'package:clark_vpn/models/user_model.dart';

class AuthProvider extends ChangeNotifier {
  final AuthService _authService = AuthService();
  User? _currentUser;
  bool _isAuthenticated = false;
  bool get isAuthenticated => _isAuthenticated;
  User? get currentUser => _currentUser;

  Future<void> checkLoginStatus() async {
    try {
      final token = await _authService.getToken();
      if (token != null) {
        _currentUser = await _authService.getMe();
        _isAuthenticated = true;
      } else {
        _isAuthenticated = false;
      }
    } catch (e) {
      _isAuthenticated = false;
      _currentUser = null;
      print('Error checking login status: $e');
    }
    notifyListeners();
  }

  Future<bool> login(String email, String password) async {
    try {
      _currentUser = await _authService.login(email, password);
      _isAuthenticated = true;
      notifyListeners();
      return true;
    } catch (e) {
      _isAuthenticated = false;
      _currentUser = null;
      print('Login failed: $e');
      notifyListeners();
      return false;
    }
  }

  Future<void> logout() async {
    await _authService.deleteToken();
    _isAuthenticated = false;
    _currentUser = null;
    notifyListeners();
  }
}
