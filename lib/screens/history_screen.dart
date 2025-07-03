import 'package:flutter/material.dart';
import '../providers/history_manager.dart';
import '../widgets/route_card_history.dart';

class HistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final historyRoutes = HistoryManager.historyRoutes;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'History of applied routes',
          style: TextStyle(
              fontFamily: 'Lato',
              fontWeight: FontWeight.bold,
              color: Color(0xFF1F1047)),
        ),
        backgroundColor: Colors.white70,
      ),
      body: historyRoutes.isEmpty
          ? Center(child: Text("No routes yet."))
          : ListView.builder(
        itemCount: historyRoutes.length,
        itemBuilder: (context, index) {
          return RouteHistoryCard(route: historyRoutes[index]);
        },
      ),
    );
  }
}
