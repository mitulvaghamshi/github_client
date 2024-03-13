import 'package:flutter_test/flutter_test.dart';
import 'package:github_client/main.dart';

void main() {
  testWidgets('test github login button present', (tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const App());
    expect(find.text('Login to GitHub'), findsOneWidget);
  });
}
