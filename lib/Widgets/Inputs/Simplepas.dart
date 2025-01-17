import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SimplePasswordInput extends StatefulWidget {
  final Function(String) onChanged;
  final String? errorText;
  final double width;
  TextEditingController? editingController;

  SimplePasswordInput({
    Key? key,
    required this.onChanged,
    required this.editingController,
    this.errorText,
    this.width = double.infinity,
  }) : super(key: key);

  @override
  State<SimplePasswordInput> createState() => _SimplePasswordInputState();
}

class _SimplePasswordInputState extends State<SimplePasswordInput> {
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      child: TextField(
        controller: widget.editingController,
        obscureText: !_isPasswordVisible,
        onChanged: widget.onChanged,
        style: const TextStyle(color: Colors.black),
        decoration: InputDecoration(
          errorText: widget.errorText,
          hintStyle: TextStyle(
            color: Colors.black54,
            fontFamily: GoogleFonts.roboto().fontFamily,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.black),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.black12),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.black12),
          ),
          suffixIcon: IconButton(
            icon: Icon(
              _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
              color: Colors.black54,
            ),
            onPressed: () {
              setState(() {
                _isPasswordVisible = !_isPasswordVisible;
              });
            },
          ),
        ),
      ),
    );
  }
}
