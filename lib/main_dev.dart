import 'package:flavor_banner/flavor_banner.dart';
import 'package:flutter/material.dart';

import 'package:robo_app/services/locator.dart';
import 'package:robo_app/main.dart';

void main() {
  setupLocator(
    FlavorConfig(
      flavor: Flavor.DEV,
      color: Colors.green,
    ),
  );

  return runApp(MyApp());
}
