import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class RulesMarkdown extends StatelessWidget {
  final Future futureLoader;

  RulesMarkdown({@required this.futureLoader});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: futureLoader,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Unable to retrieve the rules'),
              ],
            );
          }

          return Container(
            child: Markdown(
              data: snapshot.data,
              shrinkWrap: true,
            ),
          );
        }

        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Loading...'),
          ],
        );
      },
    );
  }
}
