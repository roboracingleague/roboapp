import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flavor_banner/flavor_banner.dart';
import 'package:flutter/material.dart';
import 'package:robo_app/models/voter.dart';
import 'package:robo_app/services/locator.dart';
import 'package:robo_app/theme/style.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: appTheme(),
      home: FlavorBanner(
        child: MyHomePage(title: 'Flutter Demo Home Page'),
        flavorConfig: locator<FlavorConfig>(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  MyHomePage({this.title});

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
            VoterShow(),
          ],
        ),
      ),
    );
  }
}

class VoterShow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Firestore.instance.collection('voter').snapshots(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) return LinearProgressIndicator();

        return _buildList(context, snapshot.data.documents);
      },
    );
  }

  Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
    return SizedBox(
      height: 200.0,
      child: ListView(
        padding: const EdgeInsets.only(top: 20.0),
        children: snapshot.map((data) => _buildListItem(context, data)).toList(),
      ),
    );
  }

  Widget _buildListItem(BuildContext context, DocumentSnapshot data) {
    final record = Voter.fromSnapshot(data);

    //Firestore.instance.collection('').document('').setData(data);

    return Padding(
      key: ValueKey(record.id),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: ListTile(
          title: Text(record.id),
          trailing: Text(record.id),
          onTap: () => print(record),
        ),
      ),
    );
  }
}

