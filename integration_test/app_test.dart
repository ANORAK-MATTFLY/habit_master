import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:habit_master/features/auth/presentaation/pages/onboarding_screen.dart';
import 'package:habit_master/shared/bloc/onboarding_cubit.dart';
import 'package:integration_test/integration_test.dart';

import './../lib/main.dart' as app;
import './../lib/features/auth/presentaation/pages/onboarding_screen.dart'
    as onBoardingScreen;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('tap on the search icon to display the onboarding screen',
      (WidgetTester tester) async {
    app.main();

    await tester.pumpAndSettle();

    // Do
    for (var i = 0; i < 1; i++) {
      await tester.tap(find.byKey(const Key('K'), skipOffstage: false));
      Future.delayed(const Duration(milliseconds: 1000));
    }

    // Trigger a frame.
    await tester.pumpAndSettle();

    // Verify the counter increments by 1.
    expect(find.byType(OnboardingScreen), findsOneWidget);
    // skipOffstage: false,
  });
}
