import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:arena_connect/models/user_model.dart';

class ApiService {
  final String baseUrl = 'http://127.0.0.1:8000/api';

  Future<Map<String, dynamic>> register(
      String name, String email, String phoneNumber, String password) async {
    final url = Uri.parse('$baseUrl/register');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'name': name,
        'email': email,
        'phone_number': phoneNumber,
        'password': password,
      }),
    );

    if (response.statusCode == 201) {
      final responseData = jsonDecode(response.body);
      return {
        'success': true,
        'data': User.fromJson(responseData['data']),
      };
    } else {
      final errorData = jsonDecode(response.body);
      return {'success': false, 'errors': errorData['data'] ?? errorData};
    }
  }

  Future<Map<String, dynamic>> login(String email, String password) async {
    final url = Uri.parse('$baseUrl/login');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      return {
        'success': true,
        'token': responseData['token'],
        'data': User.fromJson(responseData['user']),
      };
    } else {
      final errorData = jsonDecode(response.body);
      return {'success': false, 'errors': errorData['data'] ?? errorData};
    }
  }
}
