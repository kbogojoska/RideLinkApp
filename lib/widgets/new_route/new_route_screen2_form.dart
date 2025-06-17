import 'package:flutter/material.dart';
import 'package:ride_share/widgets/new_route/progress_bar.dart';
import '../../screens/new_route_screen3.dart';
import '../../screens/new_route_screen1.dart';

class NewRouteScreen2Form extends StatelessWidget {
  final TextEditingController vehicleTypeController;
  final TextEditingController licensePlateController;
  final TextEditingController colorController;

  NewRouteScreen2Form({
    required this.vehicleTypeController,
    required this.licensePlateController,
    required this.colorController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: ProgressBar(
            currentStep: 2,
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
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Vehicle Type and Model', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                TextField(
                  controller: vehicleTypeController,
                  decoration: InputDecoration(
                    hintText: 'What is the make and model of your vehicle?',
                    contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 16),

                Text('License Plate', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                TextField(
                  controller: licensePlateController,
                  decoration: InputDecoration(
                    hintText: 'Your License Plate',
                    contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 16),

                Text('Vehicle Color', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                TextField(
                  controller: colorController,
                  decoration: InputDecoration(
                    hintText: 'Vehicle Color',
                    contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 16),
              ],
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NewRouteScreen1()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(180, 60),
                  backgroundColor: Colors.grey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  'Back',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),

              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NewRouteScreen3()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(180, 60),
                  backgroundColor: Colors.blue[800],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  'Next',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
