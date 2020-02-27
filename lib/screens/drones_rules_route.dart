import 'package:flutter/material.dart';
import 'package:robo_app/components/drones_rules_markdown.dart';
import 'package:robo_app/services/rules_downloader.dart';

class DronesRulesRoute extends StatelessWidget {
  final String title;

  DronesRulesRoute({this.title = 'Drones Racing Rules'});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Hero(
                tag: 'robodrone',
                child: Image(
                  image: AssetImage('assets/drone.png'),
                ),
              ),
            ),
            //TODO : place url in config
            Expanded(
              child: DronesRulesMarkdown(
                downloader: RulesDownloader(
                  'https://raw.githubusercontent.com/roboracingleague/roboracingleague.github.io/master/rules',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}