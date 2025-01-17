import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:plumber_app/Backend/models/sign-In.dart';

class AuthService {
  static const String baseUrl =
      'https://american-service-specialist.vercel.app/api';

  Future<Map<String, dynamic>> signIn(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/signin'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
      );

      final data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        return {
          'success': true,
          'data': SignInResponse.fromJson(data),
        };
      } else {
        return {
          'success': false,
          'message': data['message'] ?? 'Something went wrong',
        };
      }
    } catch (e) {
      return {
        'success': false,
        'message': 'Connection error. Please try again.',
      };
    }
  }
}
