import 'package:flutter/material.dart';
import 'package:robo_app/components/rules_markdown.dart';
import 'package:robo_app/services/rules_downloader.dart';

class DronesRulesMarkdown extends StatelessWidget {
  final RulesDownloader downloader;

  DronesRulesMarkdown({@required this.downloader});

  @override
  Widget build(BuildContext context) {
    return RulesMarkdown(
      futureLoader: downloader.getDronesRules(),
    );
  }
}
