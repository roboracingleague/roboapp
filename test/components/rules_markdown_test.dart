import 'package:flutter/widgets.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:robo_app/components/rules_markdown.dart';

import 'custom_expects.dart';

void main() {
  testWidgets('should display a loading message when waiting for the future', (WidgetTester tester) async {
    Future<String> future = Future.value();

    await tester.pumpWidget(
      _boilerplate(
        RulesMarkdown(
          futureLoader: future,
        ),
      ),
    );

    expect(find.text('Loading...'), findsOneWidget);
  });

  testWidgets('should display the markdown when the future is complete', (WidgetTester tester) async {
    Future<String> future = Future.value('## Some Markdown title');

    await tester.pumpWidget(
      _boilerplate(
        RulesMarkdown(
          futureLoader: future,
        ),
      ),
    );

    await tester.pump(); // Wait for the future to complete

    expect(find.byType(Markdown), findsOneWidget);
    expectTextStrings(tester.allWidgets, <String>['Some Markdown title']);
  });

  //FIXME: There's no unit test for timeout or error management through UI as the error thrown by the future crashed the test.
}

/// Wraps a widget with a left-to-right [Directionality] for tests.
Widget _boilerplate(Widget child) {
  return Directionality(
    textDirection: TextDirection.ltr,
    child: child,
  );
}