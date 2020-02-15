import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  //Collection refrrence
  final CollectionReference booxCollection =
      Firestore.instance.collection('booxs');
}
