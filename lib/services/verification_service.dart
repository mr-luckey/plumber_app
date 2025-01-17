import 'package:http/http.dart' as http;
import 'dart:convert';

class VerificationService {
  static const String baseUrl =
      'https://american-service-specialist.vercel.app/api';

  static Future<Map<String, dynamic>> verifyOTP({
    required String email,
    required String otp,
  }) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/verify-user'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'email': email,
          'otp': otp,
        }),
      );

      final data = jsonDecode(response.body);

      // Check for the specific success message
      if (data['message'] == 'User verified successfully.') {
        return {
          'success': true,
          'message': 'User verified successfully.',
        };
      } else {
        return {
          'success': false,
          'message': data['message'] ?? 'Verification failed',
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
