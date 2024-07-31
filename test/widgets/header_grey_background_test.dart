import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:simple_cook/common/widgets/header_grey_background.dart';

void main() {
  testWidgets('HeaderGreyBackground displays correct title and style', (WidgetTester tester) async {

    const String testTitle = 'Test Header';
    const FontWeight testFontWeight = FontWeight.bold;

    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: HeaderGreyBackground(testTitle, testFontWeight),
        ),
      ),
    );

    expect(find.text(testTitle), findsOneWidget);

    final Text titleText = tester.widget(find.text(testTitle));
    expect(titleText.style!.color, Colors.black);
    expect(titleText.style!.fontSize, 24);
    expect(titleText.style!.fontWeight, testFontWeight);
  });
}