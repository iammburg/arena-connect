import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:arena_connect/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:arena_connect/models/booking.dart' as booking;

// const String baseUrl = 'http://127.0.0.1:8000/api';
const String baseUrl = 'http://localhost:8000/api';
// const String imageUrl = 'http://localhost:8000/storage/images/';

class ApiService {
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
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', responseData['token']);
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

  Future<booking.Booking?> createBooking(int userId, int fieldId,
      String bookingStart, String bookingEnd, String date, String cost) async {
    try {
      String? token = await getToken();
      if (token == null) {
        throw Exception('Token not found');
      }
      final response = await http.post(
        Uri.parse("$baseUrl/bookings"),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          "user_id": userId,
          "field_id": fieldId,
          "booking_start": bookingStart,
          "booking_end": bookingEnd,
          "date": date,
          "cost": cost,
        }),
      );

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 201) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        print('Parsed response data: $responseData');
        return booking.Booking.fromJson(responseData);
      } else {
        print('Failed to create booking: ${response.body}');
        return null;
      }
    } catch (e) {
      print('Error creating booking: $e');
      return null;
    }
  }

  Future<booking.Booking> getBooking(int bookingId) async {
    final response = await http.get(Uri.parse('$baseUrl/bookings/$bookingId'));
    if (response.statusCode == 200) {
      print(response.body);
      return booking.Booking.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load booking');
    }
  }

  Future<String?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  Future<Map<String, dynamic>> getUserProfile(String token) async {
    final url = Uri.parse('$baseUrl/user');
    final response = await http.get(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      return {
        'success': true,
        'data': responseData,
      };
    } else {
      final errorData = jsonDecode(response.body);
      return {'success': false, 'errors': errorData};
    }
  }
}
