import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:simple_cook/common/widgets/simple_cook_appbar.dart';
import 'package:simple_cook/common/theme.dart';

void main() {
  testWidgets('SimpleCookAppBar displays correct title and icon', (WidgetTester tester) async {
    // Define the title
    const String testTitle = 'Test App Bar';

    // Build the widget
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          appBar: SimpleCookAppBar(testTitle),
        ),
      ),
    );

    expect(find.byType(PhosphorIcon), findsOneWidget);
    final PhosphorIcon icon = tester.widget(find.byType(PhosphorIcon));
    expect(icon.icon, PhosphorIcons.chefHat(PhosphorIconsStyle.regular));
    expect(icon.color, SimpleCookColors.primary);

    expect(find.text(testTitle), findsOneWidget);
    final Text titleText = tester.widget(find.text(testTitle));
    expect(titleText.style, SimpleCookTextstyles.appBar);

    final AppBar appBar = tester.widget(find.byType(AppBar));
    expect(appBar.backgroundColor, SimpleCookColors.secondary);
  });
}
