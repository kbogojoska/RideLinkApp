import 'package:flutter/material.dart';
import 'package:ride_share/widgets/new_route/progress_bar.dart';
import '../../screens/new_route_screen4.dart';
import '../../screens/new_route_screen2.dart';

class NewRouteScreen3Form extends StatefulWidget {
  final TextEditingController seatsController;
  final TextEditingController fareController;

  NewRouteScreen3Form({
    required this.seatsController,
    required this.fareController,
  });

  @override
  _NewRouteScreen3Form createState() => _NewRouteScreen3Form();
}

class _NewRouteScreen3Form extends State<NewRouteScreen3Form> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: ProgressBar(
            currentStep: 3,
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
                Text(
                  'How many free seats do you have?',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        int currentSeats = int.parse(widget.seatsController.text);
                        if (currentSeats > 1) {
                          setState(() {
                            widget.seatsController.text = (currentSeats - 1).toString();
                          });
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        shape: CircleBorder(),
                        padding: EdgeInsets.all(12),
                        backgroundColor: Colors.grey[300],
                      ),
                      child: Icon(Icons.remove, color: Colors.black),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(widget.seatsController.text),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        int currentSeats = int.parse(widget.seatsController.text);
                        setState(() {
                          widget.seatsController.text = (currentSeats + 1).toString();
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        shape: CircleBorder(),
                        padding: EdgeInsets.all(12),
                        backgroundColor: Colors.grey[300],
                      ),
                      child: Icon(Icons.add, color: Colors.black),
                    ),
                  ],
                ),
                SizedBox(height: 16),

                Text(
                  'Fare per Seat/Person',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
                      decoration: BoxDecoration(
                        color: Color(0xFFCA9393),
                        border: Border.all(color: Color(0xFFCA9393), width: 2),
                      ),
                      child: Text(
                        'den ',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        controller: widget.fareController,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.arrow_upward),
                      onPressed: () {
                        int currentFare = int.tryParse(widget.fareController.text) ?? 0;
                        widget.fareController.text = (currentFare + 1).toString();
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.arrow_downward),
                      onPressed: () {
                        int currentFare = int.tryParse(widget.fareController.text) ?? 0;
                        if (currentFare > 0) {
                          widget.fareController.text = (currentFare - 1).toString();
                        }
                      },
                    ),
                  ],
                ),
                SizedBox(height: 16),

                Container(
                  color: Colors.grey[200],
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.warning,
                            color: Colors.orange,
                            size: 24.0,
                          ),
                        ],
                      ),
                      SizedBox(height: 6),
                      Text(
                        'Cash payment',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 2),
                      Text(
                        'The passenger will pay you in the car.',
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ),
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
                    MaterialPageRoute(builder: (context) => NewRouteScreen2()),
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
                    MaterialPageRoute(builder: (context) => NewRouteScreen4()),
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
