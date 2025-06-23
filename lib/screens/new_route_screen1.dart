import 'package:flutter/material.dart';
import '../widgets/new_route/new_route_screen1_form.dart';
import '../screens/routes_drivers_screen.dart'; // Import the target screen

class NewRouteScreen1 extends StatelessWidget {
  final TextEditingController departureController = TextEditingController();
  final TextEditingController destinationController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController timeController = TextEditingController();
  final TextEditingController durationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 4,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: IconButton(
              icon: Icon(Icons.arrow_back_ios_new, color: Color(0xFF1F1047)),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => RoutesDriversScreen()),
                );              },
            ),
          ),
        ),
      ),
      extendBodyBehindAppBar: true,
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
                (MediaQuery.of(context).size.height / 5.5),
            left: 0,
            right: 0,
            child: ClipPath(
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
                child: NewRouteScreen1Form(
                  departureController: departureController,
                  destinationController: destinationController,
                  dateController: dateController,
                  timeController: timeController,
                  durationController: durationController,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}