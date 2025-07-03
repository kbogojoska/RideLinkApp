import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/route_passenger_model.dart';
import '../models/route_model.dart';
import '../providers/history_manager.dart';
import '../providers/route_provider.dart';
import '../providers/user_provider.dart';
import '../widgets/app_menu.dart';
import '../widgets/passenger_route_card.dart';
import 'post_route_screen1.dart';

class RoutesPassengersScreen extends StatefulWidget {
  @override
  _RoutesPassengersScreenState createState() => _RoutesPassengersScreenState();
}

class _RoutesPassengersScreenState extends State<RoutesPassengersScreen> {

  void handleApply(RoutePassengerModel appliedRoute) {
    final historyRoute = RouteModel(
      from: appliedRoute.from,
      to: appliedRoute.to,
      date: appliedRoute.date,
      time: appliedRoute.time,
      role: "Passenger",
      recommend: "Yes",
    );

    final routeProvider = Provider.of<RouteProvider>(context, listen: false);


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
    final routeProvider = Provider.of<RouteProvider>(context);
    final role = Provider.of<UserProvider>(context).role;

    // Build passenger routes from current provider routes dynamically
    final passengerRoutes = routeProvider.routes.map((route) => RoutePassengerModel(
      from: route.from,
      to: route.to,
      date: route.date,
      time: route.time,
      passenger: "Unknown Passenger",
    )).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Requested routes",
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
      body: passengerRoutes.isEmpty
          ? Center(
        child: Text(
          'No routes added yet.',
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
            itemCount: passengerRoutes.length,
            itemBuilder: (context, index) {
              return PassengerRouteCard(
                route: passengerRoutes[index],
                onApply: () => handleApply(passengerRoutes[index]),
              );
            },
          ),
        ),
      ),
      floatingActionButton: role == 'passenger'
          ? FloatingActionButton(
        backgroundColor: Color(0xFF1F1047),
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => PostRouteScreen1()),
          );
        },
      )
          : null,
    );
  }
}
