import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import './../lib/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('tap on the search icon to display the onboarding screen',
      (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();
    // Verify the counter increments by 1.

    // expect(find.byKey(ValueKey('K'), skipOffstage: false), findsOneWidget);
    const displayOnboardingScreenKey = Key('K');

    // Verify the counter starts at 0.
    // expect(find.byKey(displayOnboardingScreenKey), findsOneWidget);

    // Finds the floating action button to tap on.
    final Finder displayOnboardingScreenKeyTrigger = find.byKey(const Key('K'));
    // await tester.ensureVisible(find.byKey(const Key('K')));

    // Do

    await tester.tap(find.byKey(const Key('K'), skipOffstage: false));
    // Trigger a frame.
    await tester.pumpAndSettle();

    // Verify the counter increments by 1.
    expect(find.byKey(const Key('e'), skipOffstage: false), findsOneWidget);
  });
}
