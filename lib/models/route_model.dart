class RouteModel {
  final String from;
  final String to;
  final String date;
  final String? time;
  final String? driver;
  final int? passengers;
  final String? role;
  final String? recommend;

  RouteModel({required this.from,
    required this.to,
    required this.date,
    this.time,
    this.driver,
    this.passengers,
    this.role,
    this.recommend});
}