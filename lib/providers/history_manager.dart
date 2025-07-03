import 'package:emk/models/route_model.dart';

class HistoryManager {
  static final List<RouteModel> _historyRoutes = [];

  static List<RouteModel> get historyRoutes => _historyRoutes;

  static void addToHistory(RouteModel route) {
    _historyRoutes.add(route);
  }

  static void clearHistory() {
    _historyRoutes.clear();
  }
}
