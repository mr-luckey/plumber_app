import 'package:flutter/material.dart';
import 'package:plumber_app/Cosntants/constants.dart';

// ignore: must_be_immutable
class selectionCard extends StatelessWidget {
  String title;
  String data;
  selectionCard({super.key, required this.title, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 150,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: btnblue),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              data,
              width: 50,
            ),
            const SizedBox(height: 10),
            Text(
              title,
              style: bluefont.copyWith(fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
