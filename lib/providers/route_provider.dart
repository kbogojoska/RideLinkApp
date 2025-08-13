import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/route_model.dart';

class RouteProvider extends ChangeNotifier {
  final List<RouteModel> _routes = [];

  List<RouteModel> get routes => _routes;

  void addRoute(RouteModel route) {
    _routes.add(route);
    notifyListeners();
  }

  void removeRoute(RouteModel route) {
    _routes.remove(route);
    notifyListeners();
  }

  Future<void> saveRouteToBackend(RouteModel route) async {
    final url = Uri.parse('http://10.0.2.2:8080/api/route');

    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "fromLocation": route.from,
        "toLocation": route.to,
        "date": route.date,
        "time": route.time,
      }),
    );

    if (response.statusCode == 200) {
      print('Route saved to backend!');
    } else {
      throw Exception('Failed to save route to backend');
    }
  }
}
