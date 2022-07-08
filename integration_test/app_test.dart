import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import './../lib/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('tap on the search icon to display the onboarding screen',
      (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();

    // Do

    await tester.tap(find.byKey(const Key('K'), skipOffstage: false));
    // Trigger a frame.
    await tester.pumpAndSettle();

    // Verify the counter increments by 1.
    expect(
        find.text(
            "Practice daily habits made by\nhighly productive\npeople like Elon Musk and more!"),
        findsOneWidget);
    // skipOffstage: false,
  });
}
