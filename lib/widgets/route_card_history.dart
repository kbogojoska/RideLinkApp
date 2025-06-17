import 'package:flutter/material.dart';
import '../models/route_model.dart';

class RouteHistoryCard extends StatelessWidget {
  final RouteModel route;

  const RouteHistoryCard({
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(),
                Text(
                  route.date,
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                ),
              ],
            ),
            SizedBox(height: 8),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.location_on, size: 18, color: Color(0xFF1F1047)),
                        SizedBox(width: 4),
                        Text(
                          'From:',
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                    Text(
                      route.from,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 130.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.location_on, size: 18, color: Color(0xFF1F1047)),
                          SizedBox(width: 4),
                          Text(
                            'To:',
                            style: TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                      Text(
                        route.to,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.airline_seat_recline_extra, size: 18, color: Color(0xFF1F1047)),
                        SizedBox(width: 4),
                        Text(
                          'I was:',
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                    Text(
                      route.role ?? 'Unknown',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.favorite, size: 18, color: Color(0xFF1F1047)),
                        SizedBox(width: 4),
                        Text(
                          'Would I recommend:',
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                    Text(
                      route.recommend ?? 'Unknown',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}