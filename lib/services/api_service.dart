import 'dart:convert';
import 'package:http/http.dart' as http;
class ApiService {
  final String baseUrl = 'https://clark-vpn-backend.onrender.com/api';
  Future<dynamic> get(String endpoint, {String? token} ) async {
    final response = await http.get(Uri.parse('$baseUrl/$endpoint' ), headers: {'Authorization': 'Bearer $token'});
    return jsonDecode(response.body);
  }
  Future<dynamic> post(String endpoint, Map<String, dynamic> data) async {
    final response = await http.post(Uri.parse('$baseUrl/$endpoint' ), body: jsonEncode(data), headers: {'Content-Type': 'application/json'});
    return jsonDecode(response.body);
  }
}
