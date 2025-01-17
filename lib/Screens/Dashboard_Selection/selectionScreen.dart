import 'package:flutter/material.dart';
import 'package:plumber_app/Screens/Dashboard_Selection/widgets/Card.dart';
import 'package:get/get.dart';

import '../../Cosntants/constants.dart';

class Selectionscreen extends StatelessWidget {
  const Selectionscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/Logos/bgLogo.png',
              width: 500,
            )),
        Container(
          color: Colors.white.withOpacity(0.95),
        ),
        Positioned(
          top: 100,
          left: 100,
          right: 100,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/Logos/appLogo.png',
                width: 120,
              ),
              const SizedBox(height: 20),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Introduce Your Self\n',
                      style: TextStyle(
                        fontSize: 15,
                        color: btnblue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    // SizedBox(height: 10),
                    TextSpan(
                      text:
                          'We loved to learn more about you can you choose the mode of logging',
                      style: TextStyle(
                        fontSize: 8,
                        color: btnblue,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: 350,
          left: 20,
          right: 20,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  // Navigate to next screen with customer selection (0)
                  Get.toNamed('/LoginScreen', arguments: {'dashboardType': 0});
                },
                child: selectionCard(
                  title: 'Customer',
                  data: 'assets/Logos/customerLogo.png',
                ),
              ),
              SizedBox(width: 20),
              GestureDetector(
                onTap: () {
                  // Navigate to next screen with technician selection (1)
                  Get.toNamed('/LoginScreen', arguments: {'dashboardType': 1});
                },
                child: selectionCard(
                  title: 'Technician',
                  data: 'assets/Logos/plumberLogo.png',
                ),
              ),
            ],
          ),
        )
      ],
    ));
  }
}
