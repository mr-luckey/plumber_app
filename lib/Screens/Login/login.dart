import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:plumber_app/Controllers/login_controller.dart';
import 'package:plumber_app/Cosntants/constants.dart';
import 'package:plumber_app/Screens/Login/login_controller.dart';
import 'package:plumber_app/Screens/SignUp/SignUp.dart';
import 'package:plumber_app/Screens/SignUp/SignupMail.dart';
import 'package:plumber_app/Widgets/Buttons.dart';
import 'package:plumber_app/Widgets/Inputs/Number_Input.dart';
import 'package:plumber_app/Widgets/Inputs/Simple_Inputfields.dart';
import 'package:plumber_app/Widgets/Inputs/Simplepas.dart';
import 'package:plumber_app/Widgets/Inputs/countrycode.dart';
import 'package:plumber_app/Widgets/Inputs/password_input.dart';
import 'package:plumber_app/Widgets/TopBar.dart';
import 'package:flutter/gestures.dart';

class LoginScreen extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  LoginController loginController = Get.put(LoginController());
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset(
                'assets/Logos/bgLogo.png',
                width: 350,
              ),
            ),
            Container(
              color: Colors.white.withOpacity(0.95),
            ),
            Column(
              children: [
                SizedBox(
                    // height: 10,
                    ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: const TopBar(),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: RichText(
                      text: TextSpan(
                        style: blueheadingfont,
                        children: [
                          const TextSpan(text: 'Login or '),
                          TextSpan(
                            text: 'Sign Up',
                            style: blueheadingfont.copyWith(
                              decoration: TextDecoration.underline,
                              decorationColor: blueheadingfont.color,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Get.to(SignupMailScreen());

                                // Navigator.pushNamed(context, '/signup');
                              },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Email', style: labelStyle)),
                ),
                // Row(
                //   children: [
                //     Padding(
                //       padding:
                //           const EdgeInsets.only(left: 10, right: 5, top: 10),
                //       child: CountryCode(),
                //     ),
                //     Padding(
                //       padding: const EdgeInsets.only(top: 10),
                //       child: NumberInput(
                //           controller: numberController,
                //           hintText: '',
                //           width: 200), //TODO: need to make it responsive
                //     ),
                //   ],
                // ),

                Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10),
                  child: SimpleInputField(
                      controller: emailController, width: double.infinity),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Password', style: labelStyle)),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10),
                  child: SimplePasswordInput(
                    onChanged: (value) {},
                    editingController: passwordController,
                    errorText: loginController.errorMessage.value,
                  ),
                ),
                // PasswordInputField(onChanged: (value) {}),
                SizedBox(
                  height: 100,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Blueroundbutton(
                      ontap: () async {
                        // Clear previous error message
                        loginController.errorMessage.value = '';

                        // Validate email
                        if (emailController.text.trim().isEmpty) {
                          print('Email is required');
                          loginController.errorMessage.value =
                              'Email is required';
                          return;
                        }

                        // Validate email format
                        if (!GetUtils.isEmail(emailController.text.trim())) {
                          loginController.errorMessage.value =
                              'Please enter a valid email';
                          print('Please enter a valid email');
                          return;
                        }

                        // Validate password
                        if (passwordController.text.isEmpty) {
                          print('Password is required');
                          loginController.errorMessage.value =
                              'Password is required';
                          return;
                        }

                        try {
                          await loginController.signIn(
                            emailController.text.trim(),
                            passwordController.text,
                          );
                          print('Login successful');
                          Get.toNamed('/map');
                        } catch (e) {
                          print('Login failed. Please try again.');
                          loginController.errorMessage.value =
                              'Login failed. Please try again.';
                        }
                      },
                      height: 40,
                      width: double.infinity,
                      text: 'Signin'),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RoundIconBtn(
                    ontap: () {},
                    iconpath: 'assets/Logos/whatsappLogo.png',
                    title: 'Continue with WhatsApp',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RoundIconBtn(
                    ontap: () {},
                    iconpath: 'assets/Logos/emailLogo.png',
                    title: 'Continue with Number',
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
