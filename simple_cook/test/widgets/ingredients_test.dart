import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:simple_cook/common/widgets/ingredients.dart';
import 'package:simple_cook/common/theme.dart';

void main() {
  testWidgets('Ingredients widget displays ingredient list and portion correctly', (WidgetTester tester) async {

    const List<String> testIngredients = [
      '1 cup of flour',
      '2 eggs',
      '1/2 cup of sugar',
    ];
    const int testPortion = 4;

    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: Ingredients(testIngredients, testPortion),
        ),
      ),
    );

    expect(find.text('Zutaten'), findsOneWidget);
    final Text headerText = tester.widget(find.text('Zutaten'));
    expect(headerText.style, SimpleCookTextstyles.subHeader);

    expect(find.text('$testPortion Port.'), findsOneWidget);
    final Text portionText = tester.widget(find.text('$testPortion Port.'));
    expect(portionText.style, SimpleCookTextstyles.portions);

    for (String ingredient in testIngredients) {
      expect(find.text(ingredient), findsOneWidget);
      final Text ingredientText = tester.widget(find.text(ingredient));
      expect(ingredientText.style, SimpleCookTextstyles.rawText);
    }
  });
}
