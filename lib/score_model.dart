import 'package:flutter/foundation.dart';

/// 02 · The feature gets an owner.
class ScoreModel extends ChangeNotifier {
  int _score = 0;
  int get score => _score;

  void increment() {
    _score++;
    notifyListeners();
  }
}
