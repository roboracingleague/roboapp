import 'package:cloud_firestore/cloud_firestore.dart';

class Voter {
  final String id;
  final DocumentReference reference;

  Voter.fromMap(Map<String, dynamic> map, {this.reference})
    : assert(map['id'] != null),
      id = map['id'];

  Voter.fromSnapshot(DocumentSnapshot snapshot)
    : this.fromMap(snapshot.data, reference: snapshot.reference);

  @override
  String toString() => "Voter<$id>";
}