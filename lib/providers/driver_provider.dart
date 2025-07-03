import 'package:flutter/material.dart';
import '../models/route_model.dart';

class DriverProvider extends ChangeNotifier {
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
}

