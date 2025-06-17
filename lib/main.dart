import 'package:flutter/material.dart';
import 'package:emk/screens/history_screen.dart';
import 'package:emk/screens/login_screen.dart';
import 'package:emk/screens/post_route_screen2.dart';
import 'package:emk/screens/post_route_screen3.dart';
import 'package:emk/screens/profile_screen.dart';
import 'package:emk/screens/register_screen.dart';
import 'package:emk/screens/routes_drivers_screen.dart';
import 'package:emk/screens/routes_passengers_screen.dart';
import 'package:emk/screens/post_route_screen1.dart';
import 'package:emk/screens/welcome_screen.dart';

// Import your new screens
import 'package:emk/screens/new_route_screen1.dart';
import 'package:emk/screens/new_route_screen2.dart';
import 'package:emk/screens/new_route_screen3.dart';
import 'package:emk/screens/new_route_screen4.dart';
import 'package:provider/provider.dart';

import 'providers/route_provider.dart';
import 'providers/temporary_provider.dart';

void main() {
  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => TemporaryRouteProvider()),
          ChangeNotifierProvider(create: (_) => RouteProvider()),
        ],
        child: MyApp(),
      )
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Route History',
      initialRoute: '/welcome',
      routes: {
        '/welcome': (context) => WelcomeScreen(),
        '/register': (context) => RegisterScreen(),
        '/login': (context) => LoginScreen(),
        '/profile': (context) => ProfileScreen(),
        '/history': (context) => HistoryScreen(),
        '/routesDrivers': (context) => RoutesDriversScreen(),
        '/routesPassengers': (context) => RoutesPassengersScreen(),
        '/tripDetails': (context) => NewRouteScreen1(),
        '/vehicleDetails': (context) => NewRouteScreen2(),
        '/seatsAndPrice': (context) => NewRouteScreen3(),
        '/reviewConfirm': (context) => NewRouteScreen4(),
        '/tripDetails2' : (context) => PostRouteScreen1(),
        '/seatAndLuggage' : (context) => PostRouteScreen2(),
        '/reviewAndPost' : (context) => PostRouteScreen3(),
      },
    );
  }
}
