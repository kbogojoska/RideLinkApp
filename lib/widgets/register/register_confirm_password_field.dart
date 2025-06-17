import 'package:flutter/material.dart';

class ConfirmPasswordField extends StatefulWidget {
  @override
  _ConfirmPasswordFieldState createState() => _ConfirmPasswordFieldState();
}

class _ConfirmPasswordFieldState extends State<ConfirmPasswordField> {
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0x00bbbecb).withOpacity(1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        obscureText: !_isPasswordVisible,
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.lock_outline_rounded,
            color: Color(0x001F1047).withOpacity(1.0),
          ),
          suffixIcon: IconButton(
            icon: Icon(
              _isPasswordVisible ? Icons.visibility_off_outlined : Icons.visibility_outlined,
              color: Color(0x001F1047).withOpacity(1.0),
            ),
            onPressed: () {
              setState(() {
                _isPasswordVisible = !_isPasswordVisible;
              });
            },
          ),
          hintText: 'Confirm Password',
          hintStyle: TextStyle(
            fontFamily: 'Lato',
            fontSize: 15,
            fontWeight: FontWeight.normal,
            color: Color(0x001F1047).withOpacity(1.0),
          ),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 13),
        ),
      ),
    );
  }
}
