import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:simple_cook/common/widgets/loading_indicator.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:simple_cook/common/theme.dart';
import 'package:simple_cook/common/config.dart';

void main() {
  testWidgets('LoadingIndicator displays loading indicator without tips', (WidgetTester tester) async {

    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: LoadingIndicator(),
        ),
      ),
    );

    expect(find.byType(CircularProgressIndicator), findsOneWidget);

    expect(find.byType(PhosphorIcon), findsOneWidget);
    final PhosphorIcon icon = tester.widget(find.byType(PhosphorIcon));
    expect(icon.icon, PhosphorIcons.chefHat(PhosphorIconsStyle.light));
    expect(icon.color, SimpleCookColors.primary);
  });

  testWidgets('LoadingIndicator displays loading indicator with tips', (WidgetTester tester) async {

    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: LoadingIndicator(showTips: true),
        ),
      ),
    );

    expect(find.byType(CircularProgressIndicator), findsOneWidget);

    expect(find.byType(PhosphorIcon), findsOneWidget);
    final PhosphorIcon icon = tester.widget(find.byType(PhosphorIcon));
    expect(icon.icon, PhosphorIcons.chefHat(PhosphorIconsStyle.light));
    expect(icon.color, SimpleCookColors.primary);

    expect(find.byType(Text), findsOneWidget);
    final Text tipText = tester.widget(find.byType(Text));
    expect(Config.tips.contains(tipText.data), isTrue);
    expect(tipText.style, SimpleCookTextstyles.easterEgg);
  });
}
