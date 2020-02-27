import 'package:flavor_banner/flavor_banner.dart';
import 'package:flutter/material.dart';
import 'package:robo_app/screens/home_route.dart';
import 'package:robo_app/services/locator.dart';
import 'package:robo_app/theme/style.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: appTheme(),
      home: FlavorBanner(
        child: HomeRoute(title: 'Flutter Demo Home Page'),
        flavorConfig: locator<FlavorConfig>(),
      ),
    );
  }
}

