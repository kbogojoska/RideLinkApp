import 'package:flutter/material.dart';
import 'package:emk/models/route_passenger_model.dart';
import 'package:emk/screens/map_screen.dart';
import 'geocoding_helper.dart';

class PassengerRouteCard extends StatelessWidget {
  final RoutePassengerModel route;
  final VoidCallback onApply;

  const PassengerRouteCard({
    required this.route,
    required this.onApply,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        color: Color(0x00bbbecb).withOpacity(1.0),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// FROM / TO DISPLAY
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 2),
                              child: Icon(Icons.my_location, color: Color(0xFF1f1047), size: 26),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 24),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("From", style: TextStyle(color: Color(0xFF4c5475))),
                                  Text(route.from, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 40),
                        Row(
                          children: [
                            Icon(Icons.location_on, color: Color(0xFF1f1047), size: 30),
                            Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("To", style: TextStyle(color: Color(0xFF4c5475))),
                                  Text(route.to, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Positioned(
                      top: 45,
                      left: 13,
                      child: Container(
                        height: 40,
                        child: Column(
                          children: List.generate(5, (index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 2.0),
                              child: Container(
                                width: 4,
                                height: 4,
                                decoration: BoxDecoration(
                                  color: Color(0xFF1f1047),
                                  shape: BoxShape.circle,
                                ),
                              ),
                            );
                          }),
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(route.time, style: TextStyle(color: Color(0xFF4c5475), fontSize: 16, fontWeight: FontWeight.bold)),
                    Text(route.date, style: TextStyle(color: Color(0xFF4c5475))),
                  ],
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.only(top: 16.0, left: 12.0, right: 12.0),
              child: Divider(color: Color(0xFF4c5475), thickness: 1.5),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 12.0, right: 12.0),
              child: Row(
                children: [
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Requested by: ${route.passenger}",
                        style: TextStyle(
                          color: Color(0xFF1f1047),
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.map, color: Color(0xFF1f1047)),
                    tooltip: "Show Route on Map",
                    onPressed: () async {
                      final start = await GeocodingHelper.getCoordinates(route.from);
                      final end = await GeocodingHelper.getCoordinates(route.to);

                      if (start != null && end != null) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => MapScreen(
                              startLocation: start,
                              destinationLocation: end,
                            ),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Could not locate address.")),
                        );
                      }
                    },
                  ),
                  ElevatedButton(
                    onPressed: onApply,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF1f1047),
                      minimumSize: Size(90, 34),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Text("Apply", style: TextStyle(fontFamily: 'Lato', color: Colors.white)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
