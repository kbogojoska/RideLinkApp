import 'package:flutter/material.dart';

class AppMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.menu, color: Color(0xFF1F1047), size: 30),
      onPressed: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          builder: (BuildContext context) {
            return Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: Column(
                children: [
                  // Increased height of the blue area
                  Padding(
                    padding: EdgeInsets.only(top: 40), // Adjust this to change space below the status bar
                    child: Container(
                      color: Color(0xFF1F1047),
                      padding: EdgeInsets.only(
                        left: 20,
                        right: 20,
                        bottom: 10,
                      ),
                      height: 100, // Increased height of the blue area
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // App Name
                          Text(
                            'RIDE SHARE',
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          // Close Menu Icon
                          IconButton(
                            icon: Icon(Icons.menu, color: Colors.white, size: 30),
                            onPressed: () {
                              Navigator.pop(context); // Close the menu
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Menu Items
                  Expanded(
                    child: Container(
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildMenuItem(context, 'PROFILE', '/profile'),
                          _buildMenuItem(context, 'POSTS (ROUTES FROM PASSENGER)', '/routesPassengers'),
                          _buildMenuItem(context, 'TRAVELS (ROUTES BY DRIVERS)', '/routesDrivers'),
                          _buildMenuItem(context, 'ADD NEW ROUTE', '/tripDetails'),
                          _buildMenuItem(context, 'ADD NEW POST', '/tripDetails2'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildMenuItem(BuildContext context, String title, String route) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context); // Close the menu
        Navigator.pushNamed(context, route); // Navigate to the route
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
        width: double.infinity,
        child: Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xFF1F1047),
          ),
        ),
      ),
    );
  }
}
