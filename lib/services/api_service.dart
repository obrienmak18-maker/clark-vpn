import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String _baseUrl = 'http://localhost:5000/api'; // TODO: Replace with actual backend URL

  Future<Map<String, dynamic>> get(String endpoint, {String? token}) async {
    final response = await http.get(
      Uri.parse('$_baseUrl/$endpoint'),
      headers: _getHeaders(token: token),
    );
    return _handleResponse(response);
  }

  Future<Map<String, dynamic>> post(String endpoint, Map<String, dynamic> data, {String? token}) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/$endpoint'),
      headers: _getHeaders(token: token),
      body: json.encode(data),
    );
    return _handleResponse(response);
  }

  Future<Map<String, dynamic>> put(String endpoint, Map<String, dynamic> data, {String? token}) async {
    final response = await http.put(
      Uri.parse('$_baseUrl/$endpoint'),
      headers: _getHeaders(token: token),
      body: json.encode(data),
    );
    return _handleResponse(response);
  }

  Future<Map<String, dynamic>> delete(String endpoint, {String? token}) async {
    final response = await http.delete(
      Uri.parse('$_baseUrl/$endpoint'),
      headers: _getHeaders(token: token),
    );
    return _handleResponse(response);
  }

  Map<String, String> _getHeaders({String? token}) {
    final Map<String, String> headers = {
      'Content-Type': 'application/json',
    };
    if (token != null) {
      headers['Authorization'] = 'Bearer $token';
    }
    return headers;
  }

  Map<String, dynamic> _handleResponse(http.Response response) {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data: ${response.statusCode} ${response.body}');
    }
  }
}
