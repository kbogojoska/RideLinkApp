import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChooseRoleScreen extends StatelessWidget {
  final String uid;

  ChooseRoleScreen({required this.uid});

  void _selectRole(BuildContext context, String role) async {
    await FirebaseFirestore.instance.collection('users').doc(uid).set({
      'role': role,
    });

    Navigator.pushReplacementNamed(
      context,
      role == 'driver' ? '/routesDrivers' : '/routesPassengers',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Choose Role")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Are you a driver or passenger?"),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _selectRole(context, 'driver'),
              child: Text("I'm a Driver"),
            ),
            ElevatedButton(
              onPressed: () => _selectRole(context, 'passenger'),
              child: Text("I'm a Passenger"),
            ),
          ],
        ),
      ),
    );
  }
}
