import 'package:flutter/material.dart';

class HistoryProvider with ChangeNotifier {
  final List<Map<String, dynamic>> _history = [];

  List<Map<String, dynamic>> get history => _history;

  void addScore(int score) {
    final dateTime = DateTime.now();
    _history.add({
      'score': score,
      'dateTime': dateTime,
    });
    notifyListeners();
  }

  void resetHistory() {
    _history.clear();
    notifyListeners();
  }
}