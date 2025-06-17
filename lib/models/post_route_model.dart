import 'package:flutter/material.dart';

class PostRouteModel {
  String departureLocation;
  String destinationLocation;
  DateTime travelDate;
  TimeOfDay travelTime;
  int numberOfSeats;
  String luggageType;
  int smallBags;
  int mediumBags;
  int largeBags;
  String? additionalNotes;
  String? note;

  PostRouteModel({
    required this.departureLocation,
    required this.destinationLocation,
    required this.travelDate,
    required this.travelTime,
    required this.numberOfSeats,
    this.luggageType = 'no luggage',
    required this.smallBags,
    required this.mediumBags,
    required this.largeBags,
    this.additionalNotes,
    this.note,
  });
}
