import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plumber_app/Backend/functionality/OTP%20auth.dart';
import 'package:plumber_app/Screens/SignUp/OTP.dart';
import 'package:plumber_app/Widgets/Buttons.dart';
import 'package:plumber_app/Widgets/Inputs/Simple_Inputfields.dart';
import 'package:plumber_app/Widgets/TopBar.dart';
// import 'package:plumber_app/services/auth_service.dart';
import '../../Cosntants/constants.dart';

class SignupMailScreen extends StatelessWidget {
  SignupMailScreen({super.key});

  final TextEditingController email = TextEditingController();
  final RxBool isLoading = false.obs;

  void _handleSignup(BuildContext context) async {
    if (email.text.trim().isEmpty) {
      Get.snackbar('Error', 'Email is required');
      return;
    }

    isLoading(true);

    final response = await AuthService.signUp(email: email.text.trim());

    isLoading(false);

    if (response['success']) {
      Get.snackbar(
        'Success',
        response['message'],
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
      Get.toNamed('/OTP');
    } else {
      Get.snackbar(
        'Error',
        response['message'],
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      Get.to(OTPScreen());
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset('assets/Logos/bgLogo.png'),
            ),
            Container(
              color: Colors.white.withOpacity(0.95),
            ),
            Column(
              children: [
                TopBar(),
                SizedBox(height: 10),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Enter your email',
                      style: blueheadingfont,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, top: 10),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Email Address', style: labelStyle),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SimpleInputField(
                    controller: email,
                    width: 330,
                  ),
                ),
                SizedBox(height: 30),
                Obx(() => Blueroundbutton(
                    height: 40,
                    width: 300,
                    text: isLoading.value ? "Please wait..." : "Continue",
                    ontap: () {
                      _handleSignup(context);
                    })),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
