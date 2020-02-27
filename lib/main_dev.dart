import 'package:flavor_banner/flavor_banner.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

import 'package:robo_app/services/locator.dart';
import 'package:robo_app/main.dart';

void main() {
  setupLocator(
    FlavorConfig(
      flavor: Flavor.DEV,
      color: Colors.green,
    ),
  );

  Logger.root.level = Level.ALL; // defaults to Level.INFO
  Logger.root.onRecord.listen((record) {
    print('${record.level.name}: ${record.time}: ${record.message}');
  });

  return runApp(MyApp());
}
