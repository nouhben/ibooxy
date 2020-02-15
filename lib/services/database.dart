import 'package:cloud_firestore/cloud_firestore.dart';

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

  // get booxs stream
  Stream<QuerySnapshot> get booxs {
    return booxCollection.snapshots();
  }
}
