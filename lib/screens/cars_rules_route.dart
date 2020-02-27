import 'package:flutter/material.dart';
import 'package:robo_app/components/cars_rules_markdown.dart';
import 'package:robo_app/services/rules_downloader.dart';

class CarsRulesRoute extends StatelessWidget {
  final String title;

  CarsRulesRoute({this.title = 'Cars Racing Rules'});

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
                tag: 'robocar',
                child: Image(
                  image: AssetImage('assets/car.png'),
                ),
              ),
            ),
            //TODO : place url in config
            Expanded(
              child: CarRulesMarkdown(
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