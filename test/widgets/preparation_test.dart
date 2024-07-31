import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:simple_cook/common/widgets/preparation.dart';
import 'package:simple_cook/common/theme.dart';

void main() {
  testWidgets('Preparation widget displays steps correctly',
      (WidgetTester tester) async {
    const List<String> testSteps = [
      'Prepare ingredients.',
      'Mix ingredients.',
      'Cook the mixture.'
    ];

    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: Preparation(testSteps),
        ),
      ),
    );

    expect(find.text('Zubereitung'), findsOneWidget);
    final Text subheaderText = tester.widget(find.text('Zubereitung'));
    expect(subheaderText.style, SimpleCookTextstyles.subHeader);

    for (int i = 0; i < testSteps.length; i++) {
      // Verify the step number circle
      expect(find.text('${i + 1}'), findsOneWidget);
      final Text stepNumberText = tester.widget(find.text('${i + 1}'));
      expect(stepNumberText.style, SimpleCookTextstyles.steps);

      expect(find.text(testSteps[i]), findsOneWidget);
      final Text stepText = tester.widget(find.text(testSteps[i]));
      expect(stepText.style, SimpleCookTextstyles.rawText);
    }
  });
}
