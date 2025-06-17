import 'package:flutter/material.dart';
import '../../models/post_route_model.dart';
import '../../screens/post_route_screen3.dart';
import '../../screens/post_route_screen1.dart';
import 'progress_bar_for_passengers.dart';

class PostRouteScreen2Form extends StatefulWidget {
  final PostRouteModel routeModel;

  PostRouteScreen2Form({required this.routeModel});

  @override
  _PostRouteScreen2Form createState() => _PostRouteScreen2Form();
}

class _PostRouteScreen2Form extends State<PostRouteScreen2Form> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController seatsController;
  late TextEditingController smallBagsController;
  late TextEditingController mediumBagsController;
  late TextEditingController largeBagsController;
  late TextEditingController additionalNotesController;

  @override
  void initState() {
    super.initState();
    seatsController = TextEditingController(text: widget.routeModel.numberOfSeats.toString());
    smallBagsController = TextEditingController();
    mediumBagsController = TextEditingController();
    largeBagsController = TextEditingController();
    additionalNotesController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: ProgressBar(
            currentStep: 2,
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
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'How many seats do you need?',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            if (widget.routeModel.numberOfSeats > 1) {
                              widget.routeModel.numberOfSeats--;
                              seatsController.text = widget.routeModel.numberOfSeats.toString();
                            }
                          });
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
                        child: Text(seatsController.text),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            widget.routeModel.numberOfSeats++;
                            seatsController.text = widget.routeModel.numberOfSeats.toString();
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
                    'Specify what kind of luggage you have:',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Checkbox(
                        value: widget.routeModel.luggageType == 'no luggage',
                        onChanged: (bool? value) {
                          setState(() {
                            widget.routeModel.luggageType = value == true ? 'no luggage' : '';
                          });
                        },
                      ),
                      Text('No luggage'),
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: widget.routeModel.luggageType == 'Small Bag',
                        onChanged: (bool? value) {
                          setState(() {
                            widget.routeModel.luggageType = value == true ? 'Small Bag' : '';
                          });
                        },
                      ),
                      Text('Small Bag (e.g., backpack)'),
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: widget.routeModel.luggageType == 'Medium Bag',
                        onChanged: (bool? value) {
                          setState(() {
                            widget.routeModel.luggageType = value == true ? 'Medium Bag' : '';
                          });
                        },
                      ),
                      Text('Medium Bag (e.g., duffle bag)'),
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: widget.routeModel.luggageType == 'Large Bag',
                        onChanged: (bool? value) {
                          setState(() {
                            widget.routeModel.luggageType = value == true ? 'Large Bag' : '';
                          });
                        },
                      ),
                      Text('Large Bag (e.g., suitcase)'),
                    ],
                  ),
                  SizedBox(height: 16),

                  Text(
                    'Specify the number of bags for each size:',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      _buildBagInputField('Small Bags', smallBagsController),
                      _buildBagInputField('Medium Bags', mediumBagsController),
                      _buildBagInputField('Large Bags', largeBagsController),
                    ],
                  ),
                  SizedBox(height: 16),

                  Text(
                    'Additional Luggage Notes',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  TextFormField(
                    controller: additionalNotesController,
                    decoration: InputDecoration(
                      hintText: 'e.g., "One of the bags contains fragile items"',
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
                    ),
                    onChanged: (value) {
                      widget.routeModel.additionalNotes = value;
                    },
                  ),
                  SizedBox(height: 16),
                ],
              ),
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
                    MaterialPageRoute(builder: (context) => PostRouteScreen1()),
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
                    MaterialPageRoute(builder: (context) => PostRouteScreen3()),
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
        SizedBox(height: 16),
      ],
    );
  }

  Widget _buildBagInputField(String label, TextEditingController controller) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
            TextFormField(
              controller: controller,
              decoration: InputDecoration(
                hintText: '0',
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                if (label == 'Small Bags') {
                  widget.routeModel.smallBags = int.tryParse(value) ?? 0;
                } else if (label == 'Medium Bags') {
                  widget.routeModel.mediumBags = int.tryParse(value) ?? 0;
                } else if (label == 'Large Bags') {
                  widget.routeModel.largeBags = int.tryParse(value) ?? 0;
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
