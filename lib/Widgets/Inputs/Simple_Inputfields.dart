import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SimpleInputField extends StatelessWidget {
  final TextEditingController controller;
  // final String hintText;
  final double width;
  const SimpleInputField(
      {super.key,
      required this.controller,
      // required this.hintText,
      required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,

      // width: double.infinity,
      child: TextField(
        controller: controller,
        style: TextStyle(color: Colors.black),
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          // filled: true,
          // focusColor: Colors.black12,
          // fillColor: Colors.black,
          // hintText: hintText,
          hintStyle: TextStyle(
              color: Colors.black54,
              fontFamily: GoogleFonts.roboto().fontFamily),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.black),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.black12),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.black12),
          ),
        ),
      ),
    );
  }
}
