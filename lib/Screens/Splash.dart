import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plumber_app/Cosntants/constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Add timer to navigate after 10 seconds
    Future.delayed(const Duration(seconds: 5), () {
      Get.offNamed(
          '/selection'); // This will replace splash screen with home screen
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
              child: Image.asset(
            'assets/images/bdmain.png',
            fit: BoxFit.cover,
          )),
          Container(
            color: Colors.white.withOpacity(0.95),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/Logos/appLogo.png',
                  width: 150,
                ),
                // const SizedBox(height: 20),
              ],
            ),
          ),
          Positioned(
            bottom: 50,
            left: 80,
            right: 80,
            child: Center(
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Find and connecting with ',
                      style: TextStyle(
                        fontSize: 12,
                        color: btnblue,
                      ),
                    ),
                    TextSpan(
                      text: 'trusted local professionals ',
                      style: TextStyle(
                        fontSize: 12,
                        color: btnblue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: 'around you',
                      style: TextStyle(
                        fontSize: 12,
                        color: btnblue,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
