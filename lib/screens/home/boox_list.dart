import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

class BooxList extends StatefulWidget {
  @override
  _BooxListState createState() => _BooxListState();
}

class _BooxListState extends State<BooxList> {
  @override
  Widget build(BuildContext context) {
    final booxs = Provider.of<QuerySnapshot>(context);
    for (var item in booxs.documents) {
      print(item.data);
    }
    return Container();
  }
}
