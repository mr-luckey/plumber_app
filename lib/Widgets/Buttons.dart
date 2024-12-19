import 'package:flutter/material.dart';
import 'package:plumber_app/Cosntants/constants.dart';

class Blueroundbutton extends StatelessWidget {
  final double height;
  final double width;
  final String text;

  Blueroundbutton(
      {super.key,
      required this.height,
      required this.width,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: btnblue,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Center(
        child: Text(text, style: whitefont),
      ),
    );
  }
}

class RoundborderBtn extends StatelessWidget {
  const RoundborderBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: btnblue),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Center(
        child: Text('Get Started', style: bluefont),
      ),
    );
  }
}

class RoundIconBtn extends StatelessWidget {
  const RoundIconBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
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
          Icon(Icons.wechat_sharp, color: btnblue),
          SizedBox(width: 30),
          Text('Continue with WhatsApp',
              style:
                  bluefont.copyWith(fontWeight: FontWeight.w100, fontSize: 18)),
        ],
      ),
    );
  }
}
