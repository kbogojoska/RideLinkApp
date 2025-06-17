import 'package:flutter/material.dart';

class SquigglyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(0, size.height);

    var firstStart = Offset(size.width/5, size.height);
    var firstEnd = Offset(size.width/3, size.height-30.0);

    path.quadraticBezierTo(firstStart.dx, firstStart.dy, firstEnd.dx, firstEnd.dy);

    var secondStart = Offset(size.width/2.25, size.height-55.0);
    var secondEnd = Offset(size.width-(size.width/3), size.height-120.0);

    path.quadraticBezierTo(secondStart.dx, secondStart.dy, secondEnd.dx, secondEnd.dy);

    var thirdStart = Offset(size.width/1.3, size.height-155.0);
    var thirdEnd = Offset(size.width, size.height-170.0);

    path.quadraticBezierTo(thirdStart.dx, thirdStart.dy, thirdEnd.dx, thirdEnd.dy);

    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}