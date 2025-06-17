class ReviewModel {
  final String from;
  final String to;
  final String date;
  final String time;
  final int? price;
  final int seats;
  final int? smallBags;
  final int? mediumBags;
  final int? largeBags;

  ReviewModel({
    required this.from,
    required this.to,
    required this.date,
    required this.time,
    this.price,
    required this.seats,
    this.smallBags,
    this.mediumBags,
    this.largeBags,
  });
}
