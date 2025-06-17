import 'package:flutter/material.dart';
import 'package:ride_share/widgets/register/register_confirm_password_field.dart';
import 'package:ride_share/widgets/register/register_password_field.dart';

class RegisterForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Create an account',
          style: TextStyle(
            fontFamily: 'Lato',
            fontSize: 35,
            fontWeight: FontWeight.bold,
            color: Color(0x001f1047).withValues(alpha: 1.0),
          ),
        ),
        SizedBox(height: 8),
        Text(
          'Join the others',
          style: TextStyle(
            fontFamily: 'Lato',
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0x001F1047).withValues(alpha: 1.0),
          ),
        ),
        SizedBox(height: 30),
        Container(
          decoration: BoxDecoration(
            color: Color(0x00bbbecb).withValues(alpha: 1),
            borderRadius: BorderRadius.circular(15),
          ),
          child: TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.person_outline_rounded, color: Color(0x001F1047).withValues(alpha: 1.0)),
              hintText: 'Username',
              hintStyle: TextStyle(
                fontFamily: 'Lato',
                fontSize: 15,
                fontWeight: FontWeight.normal,
                color: Color(0x001F1047).withValues(alpha: 1.0),
              ),
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 13),
            ),
          ),
        ),
        SizedBox(height: 20),
        Container(
          decoration: BoxDecoration(
            color: Color(0x00bbbecb).withValues(alpha: 1),
            borderRadius: BorderRadius.circular(15),
          ),
          child: TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.email_outlined, color: Color(0x001F1047).withValues(alpha: 1.0)),
              hintText: 'Email',
              hintStyle: TextStyle(
                fontFamily: 'Lato',
                fontSize: 15,
                fontWeight: FontWeight.normal,
                color: Color(0x001F1047).withValues(alpha: 1.0),
              ),
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 13),
            ),
          ),
        ),
        SizedBox(height: 20),
        RegisterPasswordField(),
        SizedBox(height: 20),
        ConfirmPasswordField(),
        SizedBox(height: 50),
        ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/login');
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0x001F1047).withValues(alpha: 1.0),
            padding: EdgeInsets.symmetric(vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(28),
            ),
            textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          child: SizedBox(
            width: double.infinity,
            child: Text(
              'Sign Up',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'Lato',
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.normal
              ),
            ),
          ),
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Already have an account? ",
              style: TextStyle(fontFamily: 'Lato',color: Colors.grey[600]),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/login');
              },
              child: Text(
                'Sign In',
                style: TextStyle(
                    fontFamily: 'Lato',
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
