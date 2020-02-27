import 'package:flutter/material.dart';
import 'package:robo_app/components/rules_markdown.dart';
import 'package:robo_app/services/rules_downloader.dart';

class CarRulesMarkdown extends StatelessWidget {
  final RulesDownloader downloader;

  CarRulesMarkdown({@required this.downloader});

  @override
  Widget build(BuildContext context) {
    return RulesMarkdown(
      futureLoader: downloader.getCarsRules(),
    );
  }
}
