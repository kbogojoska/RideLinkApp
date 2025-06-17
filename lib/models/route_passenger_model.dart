class RoutePassengerModel {
  final String from;
  final String to;
  final String date;
  final String time;
  final String? passenger;

  RoutePassengerModel({required this.from,
    required this.to,
    required this.date,
    required this.time,
    this.passenger,});
}