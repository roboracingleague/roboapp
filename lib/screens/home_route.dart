import 'package:flutter/material.dart';
import 'package:robo_app/screens/rules_route.dart';

class HomeRoute extends StatelessWidget {
  final String title;

  HomeRoute({this.title});

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
            RaisedButton(
              child: const Text('Rules'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RulesRoute()),
                );
              },
            ),
            //VoterShow()
          ],
        ),
      ),
    );
  }
}