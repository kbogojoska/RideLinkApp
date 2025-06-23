import 'package:emk/providers/user_provider.dart';
import 'package:emk/screens/choose_role_screen.dart';
import 'package:emk/services/firebase_service.dart';
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


import 'package:emk/screens/new_route_screen1.dart';
import 'package:emk/screens/new_route_screen2.dart';
import 'package:emk/screens/new_route_screen3.dart';
import 'package:emk/screens/new_route_screen4.dart';
import 'package:provider/provider.dart';

import 'providers/route_provider.dart';
import 'providers/temporary_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  debugPrint('Starting Firebase initialization...');
  try {
     await FirebaseService.initialize();
    debugPrint('Firebase initialized successfully');
    runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => TemporaryRouteProvider()),
          ChangeNotifierProvider(create: (_) => RouteProvider()),
          ChangeNotifierProvider(create: (_) => UserProvider()),
        ],
        child: MyApp(),
      )
  ); }
  catch (e) {
    debugPrint('Firebase initialization failed: $e');
    runApp(
      MaterialApp(
        home: Scaffold(
          body: Center(
            child: Text('Failed to initialize Firebase: $e'),
          ),
        ),
      ),
    );
  }
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
        '/chooseRole': (context) => ChooseRoleScreen(uid: ''),
      },
    );
  }
}
