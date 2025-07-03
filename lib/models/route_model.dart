class RouteModel {
  final String from;
  final String to;
  final String date;
  final String time;
  final String? driver;
  final int? passengers;
  final String? role;
  final String? recommend;
  final int? seats;

  RouteModel({required this.from,
    required this.to,
    required this.date,
    required this.time,
    this.driver,
    this.passengers,
    this.role,
    this.seats,
    this.recommend});

  factory RouteModel.fromMap(Map<String, dynamic> map) {
    return RouteModel(
      from: map['from'],
      to: map['to'],
      date: map['date'],
      time: map['time'],
      role: map['role'],
      recommend: map['recommend'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'from': from,
      'to': to,
      'date': date,
      'time': time,
      'driver': driver,
      'passengers': passengers,
      'role': role,
      'seats': seats,
      'recommend': recommend,
    };
  }
}