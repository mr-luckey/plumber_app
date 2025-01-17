// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:plumber_app/Cosntants/constants.dart';

class Blueroundbutton extends StatelessWidget {
  final double height;
  final double width;
  final String text;
  Function ontap;

  Blueroundbutton(
      {super.key,
      required this.height,
      required this.width,
      required this.text,
      required this.ontap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ontap();
      },
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: btnblue,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Center(
          child: Text(text, style: whitefont),
        ),
      ),
    );
  }
}

class RoundborderBtn extends StatelessWidget {
  final title;
  Function ontap;
  RoundborderBtn({super.key, required this.title, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ontap();
      },
      child: Container(
        height: 55,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: btnblue),
          borderRadius: BorderRadius.circular(50),
        ),
        child: Center(
          child: Text(title, style: bluefont),
        ),
      ),
    );
  }
}

class RoundIconBtn extends StatelessWidget {
  String iconpath;
  Function ontap;
  String title;
  RoundIconBtn(
      {super.key,
      required this.iconpath,
      required this.title,
      required this.ontap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: btnblue),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.values(),
        children: [
          SizedBox(width: 40),
          Image.asset(iconpath, width: 20),
          SizedBox(width: 20),
          Text(title,
              style:
                  bluefont.copyWith(fontWeight: FontWeight.w100, fontSize: 18)),
        ],
      ),
    );
  }
}
