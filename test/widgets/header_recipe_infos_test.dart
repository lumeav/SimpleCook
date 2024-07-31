import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:simple_cook/common/widgets/header_recipe_infos.dart';
import 'package:simple_cook/common/theme.dart';
import 'package:simple_cook/common/widgets/recipe_infos.dart';

void main() {
  testWidgets('HeaderRecipeInfos displays correct title and duration', (WidgetTester tester) async {

    const String testTitle = 'Test Recipe Title';
    const String testDuration = '45';

    // Build the widget
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: HeaderRecipeInfos(testTitle, testDuration),
        ),
      ),
    );

    expect(find.byType(AutoSizeText), findsOneWidget);
    final AutoSizeText autoSizeText = tester.widget(find.byType(AutoSizeText));
    expect(autoSizeText.data, testTitle);
    expect(autoSizeText.style, SimpleCookTextstyles.header);
    expect(autoSizeText.maxLines, 2);

    expect(find.byType(RecipeInfos), findsOneWidget);
    final RecipeInfos recipeInfos = tester.widget(find.byType(RecipeInfos));
    expect(recipeInfos.textTime, testDuration);
  });
}
