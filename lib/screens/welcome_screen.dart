import 'package:flutter/material.dart';

import '../widgets/welcome/sign_in_up.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            child: Image.asset(
              'assets/background.png',
              fit: BoxFit.cover,
              alignment: Alignment.center,
            ),
          ),
          Column(
            children: [
              SizedBox(
                height: 280,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 70),
                child: Text(
                  'TRAVEL MATCH',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Lato',
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 70),
                child: Text(
                  'SHARE YOUR RIDE',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Lato',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 40),
            ],
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 120),
                Image.asset(
                  'assets/welcome-image.png',
                  width: 200,
                  height: 180,
                ),
              ],
            ),
          ),
          WelcomeSignInOrUpWidget(),
        ],
      ),
    );
  }
}
