import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/route_passenger_model.dart';
import '../providers/route_provider.dart';
import '../widgets/app_menu.dart';
import '../widgets/passenger_route_card.dart';
import 'post_route_screen1.dart';

class RoutesPassengersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final routes = Provider.of<RouteProvider>(context).routes;

    // Convert to List<RoutePassengerModel>
    final passengerRoutes = routes.map((route) => RoutePassengerModel(
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
        leading: null,
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
              return PassengerRouteCard(route: passengerRoutes[index]);
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF1F1047),
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => PostRouteScreen1()),
          );
        },
      ),
    );
  }
}
