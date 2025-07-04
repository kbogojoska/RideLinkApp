import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:emk/screens/new_route_screen2.dart';
import 'package:emk/widgets/new_route/progress_bar.dart';
import 'package:emk/providers/temporary_route_provider.dart';

class NewRouteScreen1Form extends StatelessWidget {
  final TextEditingController departureController;
  final TextEditingController destinationController;
  final TextEditingController dateController;
  final TextEditingController timeController;
  final TextEditingController durationController;

  NewRouteScreen1Form({
    required this.departureController,
    required this.destinationController,
    required this.dateController,
    required this.timeController,
    required this.durationController,
  });

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (selectedDate != null) {
      dateController.text =
      '${selectedDate.year}-${selectedDate.month}-${selectedDate.day}';
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? selectedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (selectedTime != null) {
      timeController.text = selectedTime.format(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: ProgressBar(
            currentStep: 1,
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
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Departure Location',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                TextField(
                  controller: departureController,
                  decoration: InputDecoration(
                    hintText: 'Where are you traveling from?',
                    contentPadding:
                    EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 16),

                Text(
                  'Destination Location',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                TextField(
                  controller: destinationController,
                  decoration: InputDecoration(
                    hintText: 'Where are you traveling to?',
                    contentPadding:
                    EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 16),

                Text(
                  'Travel Date',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                TextField(
                  controller: dateController,
                  decoration: InputDecoration(
                    hintText: 'Select travel date',
                    contentPadding:
                    EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
                    border: OutlineInputBorder(),
                  ),
                  readOnly: true,
                  onTap: () {
                    _selectDate(context);
                  },
                ),
                SizedBox(height: 16),

                Text(
                  'Travel Time',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                TextField(
                  controller: timeController,
                  decoration: InputDecoration(
                    hintText: 'Select travel time',
                    contentPadding:
                    EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
                    border: OutlineInputBorder(),
                  ),
                  readOnly: true,
                  onTap: () {
                    _selectTime(context);
                  },
                ),
                SizedBox(height: 16),

                Text(
                  'Enter the duration of the trip',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                TextField(
                  controller: durationController,
                  decoration: InputDecoration(
                    hintText: '00:00',
                    contentPadding:
                    EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 16),
              ],
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: ElevatedButton(
            onPressed: () {
              Provider.of<TemporaryDriverProvider>(context, listen: false)
                  .setStep1(
                from: departureController.text,
                to: destinationController.text,
                date: dateController.text,
                time: timeController.text,
              );

              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NewRouteScreen2()),
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
              'Next',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
        ),
        SizedBox(height: 16),
      ],
    );
  }
}