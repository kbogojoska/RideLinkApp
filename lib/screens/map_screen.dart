import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:math';

import '../widgets/app_menu.dart';

class MapScreen extends StatefulWidget {
  final LatLng startLocation;
  final LatLng destinationLocation;

  const MapScreen({
    required this.startLocation,
    required this.destinationLocation,
    Key? key,
  }) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  List<LatLng> _routePoints = [];
  late MapController _mapController;
  bool _isLoadingRoute = true;

  @override
  void initState() {
    super.initState();
    _mapController = MapController();
    _fetchRoute();
  }

  Future<void> _fetchRoute() async {
    final start = widget.startLocation;
    final end = widget.destinationLocation;

    try {
      final response = await http.get(Uri.parse(
        'http://router.project-osrm.org/route/v1/driving/'
            '${start.longitude},${start.latitude};'
            '${end.longitude},${end.latitude}?overview=full&geometries=geojson',
      ));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final coords = data['routes'][0]['geometry']['coordinates'] as List;
        setState(() {
          _routePoints = coords
              .map((coord) => LatLng(coord[1], coord[0]))
              .toList();
          _isLoadingRoute = false;
        });

        _fitBounds();
      } else {
        throw Exception('Failed to load route');
      }
    } catch (e) {
      print('Route error: $e');
      setState(() {
        _routePoints = [start, end];
        _isLoadingRoute = false;
      });
    }
  }

  void _fitBounds() {
    final bounds = LatLngBounds(
      LatLng(
        min(widget.startLocation.latitude, widget.destinationLocation.latitude),
        min(widget.startLocation.longitude, widget.destinationLocation.longitude),
      ),
      LatLng(
        max(widget.startLocation.latitude, widget.destinationLocation.latitude),
        max(widget.startLocation.longitude, widget.destinationLocation.longitude),
      ),
    );

    _mapController.fitBounds(bounds, options: FitBoundsOptions(padding: EdgeInsets.all(50)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Map",
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
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        automaticallyImplyLeading: false,
      ),
      body: Stack(
        children: [
          FlutterMap(
            mapController: _mapController,
            options: MapOptions(initialCenter: widget.startLocation, initialZoom: 13),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.example.app',
              ),
              MarkerLayer(
                markers: [
                  Marker(
                    point: widget.startLocation,
                    width: 40,
                    height: 40,
                    child: Icon(Icons.location_on, color: Colors.blue, size: 40),
                  ),
                  Marker(
                    point: widget.destinationLocation,
                    width: 40,
                    height: 40,
                    child: Icon(Icons.flag, color: Colors.red, size: 40),
                  ),
                ],
              ),
              if (_routePoints.isNotEmpty)
                PolylineLayer(
                  polylines: [
                    Polyline(
                      points: _routePoints,
                      color: Colors.green,
                      strokeWidth: 4,
                    ),
                  ],
                ),
            ],
          ),
          if (_isLoadingRoute)
            Center(child: CircularProgressIndicator()),
        ],
      ),
    );
  }
}
