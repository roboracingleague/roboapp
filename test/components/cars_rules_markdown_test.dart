import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:robo_app/components/cars_rules_markdown.dart';
import 'package:robo_app/services/rules_downloader.dart';

import 'custom_expects.dart';

class MockRulesDownloader extends Mock implements RulesDownloader {}

void main() {
  RulesDownloader downloader;

  setUp(() async {
    downloader = MockRulesDownloader();
  });

  testWidgets('should display the car rules when they are retrieved', (WidgetTester tester) async {
    when(
      downloader.getCarsRules(),
    ).thenAnswer(
        (_) => Future.value('# The Car Rules'),
    );

    await tester.pumpWidget(
      _boilerplate(
        CarRulesMarkdown(
          downloader: downloader,
        ),
      ),
    );

    await tester.pump(); // Wait for the future to complete

    expectTextStrings(tester.allWidgets, <String>['The Car Rules']);
  });
}

/// Wraps a widget with a left-to-right [Directionality] for tests.
Widget _boilerplate(Widget child) {
  return MaterialApp(
    home: child,
  );
}