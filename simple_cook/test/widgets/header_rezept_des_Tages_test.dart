import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:simple_cook/common/theme.dart';
import 'package:simple_cook/ui/explore/widgets/header_rezept_des_tages.dart';

void main() {
  testWidgets('HeaderRezeptDesTages displays correct title and static text', (WidgetTester tester) async {

    const String testTitle = 'Test Recipe Title';

    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: HeaderRezeptDesTages(testTitle),
        ),
      ),
    );

    expect(find.text('Rezept des Tages'), findsOneWidget);
    final Text rezeptDesTagesText = tester.widget(find.text('Rezept des Tages'));
    expect(rezeptDesTagesText.style, SimpleCookTextstyles.rezeptDesTages);

    expect(find.text(testTitle), findsOneWidget);
    final Text titleText = tester.widget(find.text(testTitle));
    expect(titleText.style, SimpleCookTextstyles.header);
  });
}
