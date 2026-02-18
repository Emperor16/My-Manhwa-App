import 'package:flutter_test/flutter_test.dart';
import 'package:firstapp/main.dart';

void main() {
  testWidgets('ManhwaApp smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const ManhwaApp());
    expect(find.text('ManhwaVerse'), findsOneWidget);
  });
}
