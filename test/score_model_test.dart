import 'package:flutter_test/flutter_test.dart';
import 'package:score_demo/score_model.dart';

void main() {
  test('increment updates state and notifies', () {
    final model = ScoreModel();
    var notified = 0;
    model.addListener(() => notified++);

    model.increment();

    expect(model.score, 1);
    expect(notified, 1);
  });
}
