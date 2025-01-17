import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plumber_app/Screens/Dashboard_Selection/selectionScreen.dart';
import 'package:plumber_app/Screens/Location/LocationPermission/location_permission_screen.dart';
import 'package:plumber_app/Screens/Login/login.dart';
import 'package:plumber_app/Screens/Location/Map/map_screen.dart';
import 'package:plumber_app/Screens/SignUp/OTP.dart';
import 'package:plumber_app/Screens/SignUp/SignUp.dart';
import 'package:plumber_app/Screens/SignUp/SignupMail.dart';
import 'package:plumber_app/Screens/Splash.dart';
// Import your pages here

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => const SplashScreen()),
        GetPage(name: '/selection', page: () => const Selectionscreen()),
        GetPage(name: '/LoginScreen', page: () => LoginScreen()),
        GetPage(name: '/SignUp ', page: () => SignupScreen()),
        GetPage(
            name: '/location_permission',
            page: () => const LocationPermissionScreen()),
        GetPage(name: '/map', page: () => const MapScreen()),
        GetPage(name: '/OTP', page: () => const OTPScreen()),
        GetPage(name: '/mailsignuo', page: () => SignupMailScreen()),

        // Add more routes as needed
      ],
    );
  }
}
