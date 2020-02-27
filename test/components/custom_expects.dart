import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

void expectTextStrings(Iterable<Widget> widgets, List<String> strings) {
  int currentString = 0;
  for (Widget widget in widgets) {
    if (widget is RichText) {
      final TextSpan span = widget.text;
      final String text = _extractTextFromTextSpan(span);
      expect(text, equals(strings[currentString]));
      currentString += 1;
    }
  }
}

String _extractTextFromTextSpan(TextSpan span) {
  String text = span.text ?? '';
  if (span.children != null) {
    for (TextSpan child in span.children) {
      text += _extractTextFromTextSpan(child);
    }
  }
  return text;
}