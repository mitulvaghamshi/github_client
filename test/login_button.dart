import 'package:flutter_test/flutter_test.dart';
import 'package:github_app/main.dart';

void main() {
  testWidgets('Github login button present', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MainApp());
    expect(find.text('Login to GitHub'), findsOneWidget);
  });
}
