
import 'package:flutter/material.dart';

class TemporaryDriverProvider extends ChangeNotifier {
  String from = '';
  String to = '';
  String date = '';
  String time = '';
  String passenger = '';

  void setStep1({required String from, required String to, required String date, required String time}) {
    this.from = from;
    this.to = to;
    this.date = date;
    this.time = time;
    notifyListeners();
  }

  void setStep2({required String passenger}) {
    this.passenger = passenger;
    notifyListeners();
  }

  void clear() {
    from = '';
    to = '';
    date = '';
    time = '';
    passenger = '';
    notifyListeners();
  }
}
