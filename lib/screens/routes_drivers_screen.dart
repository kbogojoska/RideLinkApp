import 'package:emk/providers/driver_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/route_model.dart';
import '../providers/user_provider.dart';
import '../providers/history_manager.dart';
import '../widgets/route_drivers_card.dart';
import '../widgets/app_menu.dart';
import 'new_route_screen1.dart';


class RoutesDriversScreen extends StatefulWidget {
  @override
  _RoutesDriversScreenState createState() => _RoutesDriversScreenState();
}

class _RoutesDriversScreenState extends State<RoutesDriversScreen> {

  void handleApply(RouteModel appliedRoute) {
    final historyRoute = RouteModel(
      from: appliedRoute.from,
      to: appliedRoute.to,
      date: appliedRoute.date,
      time: appliedRoute.time,
      role: "Driver",
      recommend: "Yes",
    );

    final routeProvider = Provider.of<DriverProvider>(context, listen: false);

    final routeToRemove = routeProvider.routes.firstWhere(
          (route) =>
      route.from == appliedRoute.from &&
          route.to == appliedRoute.to &&
          route.date == appliedRoute.date &&
          route.time == appliedRoute.time,
      orElse: () => throw Exception("Route not found"),
    );

    routeProvider.removeRoute(routeToRemove);
    HistoryManager.addToHistory(historyRoute);
  }

  @override
  Widget build(BuildContext context) {
    final routeProvider = Provider.of<DriverProvider>(context);
    final role = Provider.of<UserProvider>(context).role;

    final driverRoutes = routeProvider.routes.where((route) => route.role == "Driver").toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Routes by drivers",
          style: TextStyle(
            fontFamily: 'Lato',
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white70,
        centerTitle: true,
        actions: [
          AppMenu(),
        ],
        automaticallyImplyLeading: false,
      ),
      backgroundColor: Colors.white,
      body: driverRoutes.isEmpty
          ? Center(
        child: Text(
          'No routes available.',
          style: TextStyle(fontSize: 16, color: Colors.grey[600]),
        ),
      )
          : Scrollbar(
        thickness: 6,
        radius: Radius.circular(10),
        thumbVisibility: true,
        child: ScrollbarTheme(
          data: ScrollbarThemeData(
            thumbColor: MaterialStateProperty.all(Colors.deepPurple),
          ),
          child: ListView.builder(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
            itemCount: driverRoutes.length,
            itemBuilder: (context, index) {
              return RouteDriversCard(
                route: driverRoutes[index],
                onApply: () => handleApply(driverRoutes[index]),
              );
            },
          ),
        ),
      ),
      floatingActionButton: role == 'driver'
          ? FloatingActionButton(
        backgroundColor: Color(0xFF1F1047),
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => NewRouteScreen1()),
          );
        },
      )
          : null,
    );
  }
}
