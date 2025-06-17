import 'package:flutter/material.dart';
import '../models/route_model.dart';

class RouteDriversCard extends StatelessWidget {
  final RouteModel route;

  const RouteDriversCard({
    required this.route,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[300],
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.location_on, size: 20, color: Color(0xFF1F1047)),
                SizedBox(width: 8),
                Text(
                  route.from,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Spacer(),
                Icon(Icons.calendar_today, size: 20, color: Color(0xFF1F1047)),
                SizedBox(width: 8),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: Text(
                      route.date,
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                ),
              ],
            ),
            SizedBox(height: 12),

            Row(
              children: [
                Icon(Icons.edit_location_sharp, size: 20, color: Color(0xFF1F1047)),
                SizedBox(width: 8),
                Text(
                  route.to,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Spacer(),
                Icon(Icons.access_time, size: 20, color: Color(0xFF1F1047)),
                SizedBox(width: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: Text(
                    route.time ?? '',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
              ],
            ),
            SizedBox(height: 12),

            Row(
              children: [
                Icon(Icons.directions_car, size: 20, color: Color(0xFF1F1047)),
                SizedBox(width: 8),
                Text(
                  route.driver ?? '',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Spacer(),
                Icon(Icons.group, size: 20, color: Color(0xFF1F1047)),
                SizedBox(width: 8),
                Text(
                  '${route.passengers} passengers',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ],
            ),
            SizedBox(height: 16),

            Center(
              child: ElevatedButton(
                onPressed: () {
                },
                child: Text(
                    'Apply',
                  style: const TextStyle(
                    color: Colors.white
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF1F1047),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}