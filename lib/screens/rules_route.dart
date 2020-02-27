import 'package:flutter/material.dart';
import 'package:robo_app/screens/cars_rules_route.dart';
import 'package:robo_app/screens/drones_rules_route.dart';

class RulesRoute extends StatelessWidget {
  final String title;

  RulesRoute({this.title = 'Races Rules'});

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
            Container(
              height: 100,
              width: 100,
            ),
            Expanded(
              child: MaterialButton(
                child: Hero(
                  tag: 'robocar',
                  child: Image(
                    image: AssetImage('assets/car.png'),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CarsRulesRoute()),
                  );
                },
              ),
            ),
            Expanded(
              child: MaterialButton(
                child: Hero(
                  tag: 'robodrone',
                  child: Image(
                    image: AssetImage('assets/drone.png'),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DronesRulesRoute()),
                  );
                },
              ),
            ),
            Container(
              height: 100,
              width: 100,
            ),
          ],
        ),
      ),
    );
  }
}