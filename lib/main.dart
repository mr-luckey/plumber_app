import 'package:flutter/material.dart';

// import 'package:plumber_app/Widgets/Number_Input.dart';
// import 'package:plumber_app/Widgets/Inputs/Simple_Inputfields.dart';
import 'package:plumber_app/Widgets/Inputs/password_input.dart';
import 'package:plumber_app/Widgets/TopBar.dart';

import 'Cosntants/constants.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
            child: Column(
          children: [
            SizedBox(height: 100),
            OnlyTitle(),
            SizedBox(height: 100),
            Text(
              'Enter Name',
              style: labelStyle,
            ),
            PasswordInputField(
                onChanged: (value) {
                  print(value);
                },
                width: 220),
          ],
        )),
      ),
    );
  }
}
