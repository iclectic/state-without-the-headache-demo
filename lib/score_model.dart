import 'package:flutter/foundation.dart';

/// 04 · The model grows: history sits beside score, same owner.
class ScoreModel extends ChangeNotifier {
  int _score = 0;
  List<int> _history = const [];

  int get score => _score;
  List<int> get history => _history;

  void increment() {
    _score++;
    // Replace, don't mutate: a new unmodifiable list every time.
    _history = List.unmodifiable([..._history, _score]);
    notifyListeners();
  }

  /// Changes history without changing score, to show Selector at work.
  void clearHistory() {
    _history = const [];
    notifyListeners();
  }
}
