import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:robo_app/components/drones_rules_markdown.dart';
import 'package:robo_app/services/rules_downloader.dart';

import 'custom_expects.dart';

class MockRulesDownloader extends Mock implements RulesDownloader {}

void main() {
  RulesDownloader downloader;

  setUp(() async {
    downloader = MockRulesDownloader();
  });

  testWidgets('should display the drone rules when they are retrieved', (WidgetTester tester) async {
    when(
      downloader.getDronesRules(),
    ).thenAnswer(
        (_) => Future.value('## The Drone Rules'),
    );

    await tester.pumpWidget(
      _boilerplate(
        DronesRulesMarkdown(
          downloader: downloader,
        ),
      ),
    );

    await tester.pump(); // Wait for the future to complete

    expectTextStrings(tester.allWidgets, <String>['The Drone Rules']);
  });
}

/// Wraps a widget with a left-to-right [Directionality] for tests.
Widget _boilerplate(Widget child) {
  return Directionality(
    textDirection: TextDirection.ltr,
    child: child,
  );
}