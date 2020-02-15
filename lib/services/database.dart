import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ibooxy/models/boox.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});
  //Collection refrrence
  final CollectionReference booxCollection =
      Firestore.instance.collection('booxs');

  Future updateUserData(String sugars, String name, int strength) async {
    return await booxCollection.document(uid).setData({
      'sugars': sugars,
      'name': name,
      'strength': strength,
    });
  }

  //boox list from a snapshot
  List<Boox> _booxListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Boox(
        name: doc.data['name'] ?? '',
        strength: doc.data['strength'] ?? 0,
        sugars: doc.data['sugars'] ?? '0',
      );
    }).toList();
  }

  // get booxs stream
  Stream<List<Boox>> get booxs {
    return booxCollection.snapshots().map(_booxListFromSnapshot);
  }
}
