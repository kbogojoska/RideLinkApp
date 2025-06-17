import 'package:flutter/material.dart';

import '../widgets/login/log_in_form.dart';
import '../widgets/squiggle_background.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/background.png',
            fit: BoxFit.cover,
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
          ),
          Container(
            color: Colors.white,
            height: MediaQuery.of(context).size.height,
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height -
                (MediaQuery.of(context).size.height / 3.25),
            left: 0,
            right: 0,
            child: ClipPath(
              clipper: SquigglyClipper(),
              child: Container(
                height: MediaQuery.of(context).size.height / 3.25,
                child: Image.asset(
                  'assets/background.png',
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              color: Colors.white,
              height: MediaQuery.of(context).size.height -
                  (MediaQuery.of(context).size.height / 3.25),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 60.0),
                child: LoginForm(),
              ),
            ),
          ),
          Positioned(
            top: 40,
            left: 20,
            child: GestureDetector(
              onTap: () {
                if (Navigator.canPop(context)) {
                  Navigator.pop(context);
                }
              },
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 1.0),
                      blurRadius: 5,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Center(
                  child: Icon(
                    Icons.arrow_back_ios_new,
                    color: Color(0xFF1F1047),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
