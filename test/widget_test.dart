import 'package:flutter_test/flutter_test.dart';
import 'package:score_demo/main.dart';

void main() {
  testWidgets('tapping + increments the score', (tester) async {
    await tester.pumpWidget(const ScoreApp());
    expect(find.text('Score: 0'), findsOneWidget);

    await tester.tap(find.text('+'));
    await tester.pump();

    expect(find.text('Score: 1'), findsOneWidget);
  });
}
