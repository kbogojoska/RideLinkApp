import 'package:flutter/material.dart';
import '../models/post_route_model.dart';
import '../widgets/new_post/post_route_screen2_form.dart';

class PostRouteScreen2 extends StatefulWidget {
  final PostRouteModel routeModel = PostRouteModel(
      departureLocation: 'City1',
      destinationLocation: 'City2',
      travelDate: DateTime(2024, 01, 15),
      travelTime: TimeOfDay(hour: 12, minute: 30),
      numberOfSeats: 2,
      smallBags: 0,
      mediumBags: 0,
      largeBags: 0,
      additionalNotes: '');


  @override
  _PostRouteScreen2 createState() => _PostRouteScreen2();
}

class _PostRouteScreen2 extends State<PostRouteScreen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
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
                (MediaQuery.of(context).size.height / 5.5),
            left: 0,
            right: 0,
            child: ClipPath(
              clipper: CustomCurveClipper(),
              child: Container(
                height: MediaQuery.of(context).size.height / 5.5,
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
              height: MediaQuery.of(context).size.height -
                  (MediaQuery.of(context).size.height / 5.5) - 40,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: PostRouteScreen2Form(routeModel: widget.routeModel),
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
