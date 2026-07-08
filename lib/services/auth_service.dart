import 'package:clark_vpn/models/user_model.dart';
import 'package:clark_vpn/services/api_service.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthService {
  final ApiService _apiService = ApiService();
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  static const String _tokenKey = 'jwt_token';

  Future<String?> getToken() async {
    return await _secureStorage.read(key: _tokenKey);
  }

  Future<void> saveToken(String token) async {
    await _secureStorage.write(key: _tokenKey, value: token);
  }

  Future<void> deleteToken() async {
    await _secureStorage.delete(key: _tokenKey);
  }

  Future<User> register(String name, String email, String password) async {
    final response = await _apiService.post(
      'auth/register',
      {
        'name': name,
        'email': email,
        'password': password,
      },
    );
    await saveToken(response['token']);
    return User.fromJson(response['user']);
  }

  Future<User> login(String email, String password) async {
    final response = await _apiService.post(
      'auth/login',
      {
        'email': email,
        'password': password,
      },
    );
    await saveToken(response['token']);
    return User.fromJson(response['user']);
  }

  Future<User> getMe() async {
    final token = await getToken();
    if (token == null) {
      throw Exception('No token found');
    }
    final response = await _apiService.get('auth/me', token: token);
    return User.fromJson(response['user']);
  }
}
