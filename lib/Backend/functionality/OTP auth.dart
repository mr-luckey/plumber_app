import 'package:http/http.dart' as http;
import 'dart:convert';

class AuthService {
  static const String baseUrl =
      'https://american-service-specialist.vercel.app/api';

  static Future<Map<String, dynamic>> signUp({required String email}) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/signup'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'email': email,
          // 'password': '1234',
          'role': 'customer',
        }),
      );

      final data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        return {
          'success': true,
          'message': data['message'],
          'id': data['id'],
        };
      } else {
        return {
          'success': false,
          'message': data['message'] ?? 'Signup failed',
        };
      }
    } catch (e) {
      return {
        'success': false,
        'message': 'An unexpected error occurred',
      };
    }
  }
}
