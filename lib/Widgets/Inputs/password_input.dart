import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PasswordInputField extends StatefulWidget {
  final Function(String) onChanged;
  final String? errorText;
  final double width;

  const PasswordInputField({
    Key? key,
    required this.onChanged,
    this.errorText,
    this.width = double.infinity,
  }) : super(key: key);

  @override
  State<PasswordInputField> createState() => _PasswordInputFieldState();
}

class _PasswordInputFieldState extends State<PasswordInputField> {
  bool _isPasswordVisible = false;
  bool _hasLetter = false;
  bool _hasNumber = false;
  bool _hasSpecialChar = false;
  bool _hasMinLength = false;

  void _validatePassword(String value) {
    setState(() {
      _hasLetter = RegExp(r'[a-zA-Z]').hasMatch(value);
      _hasNumber = RegExp(r'[0-9]').hasMatch(value);
      _hasSpecialChar = RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value);
      _hasMinLength = value.length >= 8;
    });
    widget.onChanged(value);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            obscureText: !_isPasswordVisible,
            onChanged: _validatePassword,
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(
              // hintText: 'Password',
              errorText: widget.errorText,
              hintStyle: TextStyle(
                color: Colors.black54,
                fontFamily: GoogleFonts.roboto().fontFamily,
              ),
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
          const SizedBox(height: 8),
          _ValidationItem(
            isValid: _hasLetter,
            text: 'One letter (a-z)',
          ),
          _ValidationItem(
            isValid: _hasNumber,
            text: 'One number (0-9)',
          ),
          _ValidationItem(
            isValid: _hasSpecialChar,
            text: 'One special character',
          ),
          _ValidationItem(
            isValid: _hasMinLength,
            text: '8 characters minimum',
          ),
        ],
      ),
    );
  }
}

class _ValidationItem extends StatelessWidget {
  final bool isValid;
  final String text;

  const _ValidationItem({
    Key? key,
    required this.isValid,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Icon(
            isValid ? Icons.check_circle : Icons.circle_outlined,
            color: isValid ? Colors.green : Colors.grey,
            size: 16,
          ),
          const SizedBox(width: 8),
          Text(
            text,
            style: TextStyle(
              color: isValid ? Colors.green : Colors.grey,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
