import 'package:flutter/material.dart';
import 'package:plumber_app/Widgets/Buttons.dart';
import 'package:plumber_app/Widgets/Inputs/Number_Input.dart';
import 'package:plumber_app/Widgets/Inputs/Simple_Inputfields.dart';
import 'package:plumber_app/Widgets/Inputs/password_input.dart';
import 'package:plumber_app/Widgets/TopBar.dart';
import 'package:geolocator/geolocator.dart';
// import 'package:permission_handler/permission_handler.dart';

import '../../Cosntants/constants.dart';
import '../../Widgets/Inputs/countrycode.dart';

// ignore: must_be_immutable
class SignupScreen extends StatelessWidget {
  TextEditingController firstname = TextEditingController();
  TextEditingController organizationName = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController Rolename = TextEditingController();
  TextEditingController NumberController = TextEditingController();
  SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Align(
                alignment: Alignment.bottomCenter,
                child: Image.asset('assets/Logos/bgLogo.png')),
            Container(
              color: Colors.white.withOpacity(0.95),
            ),
            Column(
              children: [
                TopBar(),
                SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Complete your info',
                      style: blueheadingfont,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, top: 10),
                      child:
                          Align(child: Text(' First Name', style: labelStyle)),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, top: 10),
                  child: SimpleInputField(controller: firstname, width: 330),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, top: 10),
                      child: Align(
                          child: Text(' Organization', style: labelStyle)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 110.0, top: 10),
                      child: Align(
                          child:
                              Text('Role of Registration', style: labelStyle)),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, top: 10),
                      child: SimpleInputField(
                          controller: organizationName, width: 160),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, top: 10),
                      child: SimpleInputField(controller: Rolename, width: 160),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Mobile Number', style: labelStyle)),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 10,
                        right: 5,
                      ),
                      child: CountryCode(),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: NumberInput(
                          controller: NumberController,
                          hintText: '',
                          width: 200), //TODO: need to make it responsive
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Password', style: labelStyle)),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                  child: PasswordInputField(onChanged: (value) {
                    print(value);
                  }),
                ),
                SizedBox(
                  height: 30,
                ),
                Blueroundbutton(
                    height: 40,
                    width: 300,
                    text: "Continue",
                    ontap: () async {
                      print('check1');
                      // Check if location permission is granted
                      LocationPermission permission =
                          await Geolocator.checkPermission();

                      if (permission == LocationPermission.denied ||
                          permission == LocationPermission.deniedForever) {
                        // Navigate to location permission screen
                        Navigator.pushNamed(context, '/location_permission');
                      } else {
                        // Check if location service is enabled
                        bool isLocationEnabled =
                            await Geolocator.isLocationServiceEnabled();

                        if (isLocationEnabled) {
                          // Navigate to map screen
                          Navigator.pushNamed(context, '/OTP');
                        } else {
                          Navigator.pushNamed(context, '/OTP');
                        }
                      }
                    })
              ],
            ),
          ],
        ),
      ),
    );
  }
}
