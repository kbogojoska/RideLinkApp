import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../models/review_model.dart';
import '../../models/route_model.dart';
import '../../providers/route_provider.dart';
import '../../providers/temporary_provider.dart';
import '../../screens/routes_passengers_screen.dart';
import '../../screens/post_route_screen1.dart';
import '../../screens/map_screen.dart';
import '../geocoding_helper.dart';
import 'progress_bar_for_passengers.dart';

class PostRouteScreen3Form extends StatefulWidget {
  final ReviewModel route;

  const PostRouteScreen3Form({required this.route});

  @override
  State<PostRouteScreen3Form> createState() => _PostRouteScreen3Form();
}

class _PostRouteScreen3Form extends State<PostRouteScreen3Form> {
  bool _isChecked = false;
  final TextEditingController _noteController = TextEditingController();

  @override
  void dispose() {
    _noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final tempProvider = Provider.of<TemporaryRouteProvider>(context);

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: ProgressBar(
            currentStep: 3,
            totalSteps: 3,
            stepLabels: [
              "Trip Details",
              "Seat & Luggage Requirements",
              "Review & Post"
            ],
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Trip Summary
                  Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Color(0xFFf2f2f2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                                        Icon(Icons.my_location,
                                            color: Color(0xFF1f1047), size: 26),
                                        SizedBox(width: 16),
                                        Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Text("From",
                                                style: TextStyle(
                                                    color: Color(0xFF4c5475))),
                                            Text(tempProvider.from,
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight:
                                                    FontWeight.bold)),
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 40),
                                    Row(
                                      children: [
                                        Icon(Icons.location_on,
                                            color: Color(0xFF1f1047), size: 30),
                                        SizedBox(width: 12),
                                        Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Text("To",
                                                style: TextStyle(
                                                    color: Color(0xFF4c5475))),
                                            Text(tempProvider.to,
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight:
                                                    FontWeight.bold)),
                                          ],
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
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 2.0),
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
                                Text(tempProvider.time,
                                    style: TextStyle(
                                        color: Color(0xFF4c5475),
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold)),
                                Text(tempProvider.date,
                                    style: TextStyle(color: Color(0xFF4c5475))),
                              ],
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 16.0),
                          child: Divider(
                              color: Color(0xFF4c5475), thickness: 1.5),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: Row(
                            children: [
                              Expanded(child: SizedBox()),
                              IconButton(
                                icon: Icon(Icons.map, color: Color(0xFF1f1047)),
                                tooltip: "Show Route on Map",
                                onPressed: () async {
                                  final start = await GeocodingHelper.getCoordinates(tempProvider.from);
                                  final end = await GeocodingHelper.getCoordinates(tempProvider.to);
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
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            PostRouteScreen1()),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xFF1f1047),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 8),
                                ),
                                child: Text(
                                  "Edit",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 14),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 24),
                  Text(
                    'Note/Message to driver (not required)',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  TextField(
                    controller: _noteController,
                    decoration: InputDecoration(
                      hintText: 'Write note/message here',
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 10, horizontal: 12),
                    ),
                    maxLines: 4,
                  ),
                  SizedBox(height: 16),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Checkbox(
                        value: _isChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            _isChecked = value ?? false;
                          });
                        },
                      ),
                      Expanded(
                        child: Text(
                          'I agree to the Terms and Conditions and Privacy Policy.',
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          child: ElevatedButton(
            onPressed: () async {
              if (!_isChecked) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Please accept Terms and Conditions.')),
                );
                return;
              }

              final tempProvider = Provider.of<TemporaryRouteProvider>(context, listen: false);
              final routeProvider = Provider.of<RouteProvider>(context, listen: false);

              final newRoute = RouteModel(
                from: tempProvider.from,
                to: tempProvider.to,
                date: tempProvider.date,
                time: tempProvider.time,
                role: "Passenger",
                recommend: _noteController.text,
                passengers: 2,
              );

              routeProvider.addRoute(newRoute);

              try {
                // Firebase
                await FirebaseFirestore.instance
                    .collection('passenger_routes')
                    .add(newRoute.toMap());

                // backend
                await routeProvider.saveRouteToBackend(newRoute);

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Ride request posted successfully!')),
                );
              } catch (e) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Error saving route: $e')),
                );
                return;
              }

              tempProvider.clear();

              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => RoutesPassengersScreen()),
                    (route) => false,
              );
            },
            style: ElevatedButton.styleFrom(
              minimumSize: Size(double.infinity, 50),
              backgroundColor: Colors.blue[800],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: Text(
              'Post Ride Request',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
