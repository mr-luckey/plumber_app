import 'package:get/get.dart';
import 'package:plumber_app/Backend/services/auth_service.dart';

class LoginController extends GetxController {
  final AuthService _authService = AuthService();

  final RxBool isLoading = false.obs;
  final RxString errorMessage = ''.obs;

  Future<void> signIn(String email, String password) async {
    try {
      isLoading.value = true;
      errorMessage.value = '';

      final result = await _authService.signIn(email, password);

      if (result['success']) {
        // Store user data/token here if needed
        Get.offAllNamed('/home'); // Navigate to home screen
      } else {
        errorMessage.value = result['message'];
      }
    } finally {
      isLoading.value = false;
    }
  }
}
