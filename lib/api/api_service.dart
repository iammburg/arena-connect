import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:arena_connect/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:arena_connect/models/booking.dart' as booking;

// const String baseUrl = 'http://127.0.0.1:8000/api';
const String baseUrl = 'https://arenaconnect.site/api';
// const String baseUrl = 'http://192.168.1.10:8000/api';
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

      debugPrint('Response status: ${response.statusCode}');
      // debugPrint('Response body: ${response.body}');

      if (response.statusCode == 201) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        debugPrint('Parsed response data: $responseData');
        return booking.Booking.fromJson(responseData);
      } else {
        debugPrint('Failed to create booking: ${response.body}');
        return null;
      }
    } catch (e) {
      debugPrint('Error creating booking: $e');
      return null;
    }
  }

  Future<booking.Booking> getBooking(int bookingId) async {
    try {
      String? token = await getToken();
      if (token == null) {
        throw Exception('Token not found');
      }

      final response = await http.get(
        Uri.parse('$baseUrl/bookings/$bookingId'),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        debugPrint(response.body);
        return booking.Booking.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to load booking: ${response.body}');
      }
    } catch (e) {
      throw Exception('Error in getBooking: $e');
    }
  }

  Future<Map<String, dynamic>> createPayment({
    required int userId,
    required int bookingId,
    required String totalPayment,
    required String status,
    required String orderId,
    String? receipt,
  }) async {
    try {
      String? token = await getToken();
      if (token == null) {
        throw Exception('Token not found');
      }

      final response = await http.post(
        Uri.parse("$baseUrl/payments"),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          "user_id": userId,
          "booking_id": bookingId,
          "total_payment": totalPayment,
          "status": status,
          "order_id": orderId,
          "receipt": receipt,
        }),
      );

      if (response.statusCode == 201) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        return {
          'success': true,
          'data': responseData['data'],
        };
      } else {
        final errorData = jsonDecode(response.body);
        debugPrint('Response status: ${response.statusCode}');
        debugPrint('Response body: ${response.body}');
        return {'success': false, 'errors': errorData['data'] ?? errorData};
      }
    } catch (e) {
      debugPrint('Error creating payment: $e');
      return {'success': false, 'errors': e.toString()};
    }
  }

  Future<Map<String, dynamic>> getBanksByFieldCentreId(
      int fieldCentreId) async {
    try {
      String? token = await getToken();
      if (token == null) {
        throw Exception('Token not found');
      }

      final response = await http.get(
        Uri.parse("$baseUrl/payments/$fieldCentreId/banks"),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        return {
          'success': true,
          'data': responseData['data'],
        };
      } else {
        final errorData = jsonDecode(response.body);
        return {'success': false, 'errors': errorData['data'] ?? errorData};
      }
    } catch (e) {
      return {'success': false, 'errors': e.toString()};
    }
  }

  Future<Map<String, dynamic>> updatePayment({
    required int paymentId,
    required int userId,
    required int bookingId,
    required String totalPayment,
    required String status,
    required String orderId,
    required int bankId,
    String? receipt,
  }) async {
    try {
      String? token = await getToken();
      if (token == null) {
        throw Exception('Token not found');
      }

      final response = await http.put(
        Uri.parse("$baseUrl/payments/$paymentId"),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          "user_id": userId,
          "booking_id": bookingId,
          "total_payment": totalPayment,
          "status": status,
          "order_id": orderId,
          "payment_id": bankId,
          "receipt": receipt,
        }),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        return {
          'success': true,
          'data': responseData['data'],
        };
      } else {
        final errorData = jsonDecode(response.body);
        return {'success': false, 'errors': errorData['data'] ?? errorData};
      }
    } catch (e) {
      return {'success': false, 'errors': e.toString()};
    }
  }

  Future<Map<String, dynamic>> uploadReceipt({
    required int paymentId,
    required int userId,
    required int bookingId,
    required String totalPayment,
    required String status,
    required String orderId,
    required String receiptPath,
    required int bankId,
  }) async {
    try {
      String? token = await getToken();
      if (token == null) {
        throw Exception('Token not found');
      }

      var request = http.MultipartRequest(
        'POST',
        Uri.parse("$baseUrl/payments/$paymentId"),
      );
      request.headers['Authorization'] = 'Bearer $token';
      request.fields['user_id'] = userId.toString();
      request.fields['booking_id'] = bookingId.toString();
      request.fields['total_payment'] = int.parse(totalPayment).toString();
      request.fields['status'] = status;
      request.fields['order_id'] = orderId;
      request.fields['payment_id'] = bankId.toString();
      request.files
          .add(await http.MultipartFile.fromPath('receipt', receiptPath));

      var response = await request.send();
      var responseBody = await response.stream.bytesToString();
      debugPrint('Response status: ${response.statusCode}');
      debugPrint('Response body: $responseBody');

      if (response.statusCode == 200) {
        final responseData = json.decode(responseBody);
        return {
          'success': true,
          'data': responseData['data'],
        };
      } else {
        final responseData = json.decode(responseBody);
        return {
          'success': false,
          'errors': responseData['data'] ?? responseData
        };
      }
    } catch (e) {
      return {'success': false, 'errors': e.toString()};
    }
  }

  Future<Map<String, dynamic>> getPaymentDetails(int paymentId) async {
    try {
      String? token = await getToken();
      if (token == null) {
        throw Exception('Token not found');
      }

      final response = await http.get(
        Uri.parse('https://arenaconnect.site/api/payments/$paymentId'),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        return {
          'success': responseData['success'],
          'data': responseData['data'],
        };
      } else {
        final Map<String, dynamic> errorData = json.decode(response.body);
        return {
          'success': false,
          'errors': errorData['message'] ?? 'Unknown error',
        };
      }
    } catch (e) {
      return {
        'success': false,
        'errors': e.toString(),
      };
    }
  }

  Future<Map<String, dynamic>> getPaymentsByUser() async {
    try {
      String? token = await getToken();
      if (token == null) {
        throw Exception('Token not found');
      }

      final userProfileResponse = await getUserProfile(token);
      if (!userProfileResponse['success']) {
        throw Exception('Failed to get user profile');
      }

      int userId = userProfileResponse['data']['id'];

      final response = await http.get(
        Uri.parse('$baseUrl/payments/user/$userId'),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        debugPrint('Payments: $responseData');
        return {
          'success': responseData['success'],
          'data': responseData['data'],
        };
      } else {
        final errorData = json.decode(response.body);
        return {
          'success': false,
          'errors': errorData['message'] ?? 'Unknown error',
        };
      }
    } catch (e) {
      return {
        'success': false,
        'errors': e.toString(),
      };
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
