import 'package:flutter_test/flutter_test.dart';
import 'package:score_demo/score_model.dart';

void main() {
  test('increment updates state', () {
    final model = ScoreModel();
    var notified = 0;
    model.addListener(() => notified++);

    model.increment();

    expect(model.score, 1);
    expect(model.history, [1]);
    expect(notified, 1);
  });

  test('clearHistory empties history but keeps the score', () {
    final model = ScoreModel()
      ..increment()
      ..increment();

    model.clearHistory();

    expect(model.score, 2);
    expect(model.history, isEmpty);
  });
}
