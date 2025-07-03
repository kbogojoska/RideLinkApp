import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../models/route_model.dart';
import '../../providers/driver_provider.dart';
import '../../providers/temporary_route_provider.dart';
import '../../screens/new_route_screen1.dart';
import '../../screens/routes_drivers_screen.dart';
import 'progress_bar.dart';

class NewRouteScreen4Form extends StatefulWidget {
  const NewRouteScreen4Form({Key? key}) : super(key: key);

  @override
  State<NewRouteScreen4Form> createState() => _NewRouteScreen4Form();
}

class _NewRouteScreen4Form extends State<NewRouteScreen4Form> {
  bool _isChecked = false;
  final TextEditingController _noteController = TextEditingController();

  @override
  void dispose() {
    _noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final tempProvider = Provider.of<TemporaryDriverProvider>(context);

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: ProgressBar(
            currentStep: 4,
            totalSteps: 4,
            stepLabels: [
              "Trip Details",
              "Vehicle Details",
              "Seats & Price",
              "Review & Confirm"
            ],
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xFFf2f2f2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 50,
                          child: Column(
                            children: [
                              const Icon(Icons.my_location,
                                  color: Color(0xFF1f1047), size: 26),
                              const SizedBox(height: 10),
                              Column(
                                children: List.generate(5, (index) {
                                  return Padding(
                                    padding:
                                    const EdgeInsets.symmetric(vertical: 2.0),
                                    child: Container(
                                      width: 4,
                                      height: 4,
                                      decoration: const BoxDecoration(
                                        color: Color(0xFF1f1047),
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                  );
                                }),
                              ),
                              const SizedBox(height: 10),
                              const Icon(Icons.location_on,
                                  color: Color(0xFF1f1047), size: 30),
                            ],
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("From",
                                  style: TextStyle(
                                      color: Color(0xFF4c5475), fontSize: 14)),
                              const SizedBox(height: 4),
                              Text(
                                tempProvider.from,
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 40),
                              const Text("To",
                                  style: TextStyle(
                                      color: Color(0xFF4c5475), fontSize: 14)),
                              const SizedBox(height: 4),
                              Text(
                                tempProvider.to,
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              tempProvider.time,
                              style: const TextStyle(
                                color: Color(0xFF4c5475),
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              tempProvider.date,
                              style:
                              const TextStyle(color: Color(0xFF4c5475)),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Note/Message to passengers (not required)',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: _noteController,
                    decoration: const InputDecoration(
                      hintText: 'Write note/message here',
                      border: OutlineInputBorder(),
                      contentPadding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
                    ),
                    maxLines: 4,
                  ),
                  const SizedBox(height: 16),
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
                      const Expanded(
                        child: Text(
                          'I agree to the Terms and Conditions and Privacy Policy.',
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => NewRouteScreen1()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF1f1047),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                      ),
                      child: const Text(
                        "Edit",
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          child: ElevatedButton(
            onPressed: () async {
              if (!_isChecked) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                      content:
                      Text('You must agree to the Terms and Conditions')),
                );
                return;
              }

              final routeProvider =
              Provider.of<DriverProvider>(context, listen: false);

              final newRoute = RouteModel(
                from: tempProvider.from,
                to: tempProvider.to,
                date: tempProvider.date,
                time: tempProvider.time,
                role: "Driver",
                driver: "RideLink",
                seats: 3,
                recommend: _noteController.text,
              );

              routeProvider.addRoute(newRoute);

              try {
                await FirebaseFirestore.instance
                    .collection('driver_routes')
                    .add(newRoute.toMap());

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Route posted successfully!')),
                );
              } catch (e) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Error saving to Firestore: $e')),
                );
                return;
              }

              tempProvider.clear();

              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => RoutesDriversScreen()),
                    (route) => false,
              );
            },
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.infinity, 50),
              backgroundColor: Colors.blue[800],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: const Text(
              'Post Route',
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
