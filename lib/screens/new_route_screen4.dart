import 'package:flutter/material.dart';
import '../widgets/new_route/new_route_screen4_form.dart';

class NewRouteScreen4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/background.png',
            fit: BoxFit.cover,
            width: double.infinity,
            height: height,
          ),
          Container(
            color: Colors.white,
            height: height,
          ),
          Positioned(
            bottom: height - (height / 5.5),
            left: 0,
            right: 0,
            child: ClipPath(
              clipper: CustomCurveClipper(),
              child: Container(
                height: height / 5.5,
                child: Image.asset(
                  'assets/background.png',
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 70,
            left: 0,
            right: 0,
            child: Container(
              color: Colors.white,
              height: height - (height / 5.5) - 40,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: NewRouteScreen4Form(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height * 0.7);

    path.quadraticBezierTo(
      size.width * 0.2, size.height * 0.55,
      size.width * 0.5, size.height * 0.6,
    );

    path.quadraticBezierTo(
      size.width * 0.8, size.height * 0.65,
      size.width, size.height * 0.5,
    );

    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
