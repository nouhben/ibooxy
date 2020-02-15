import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ibooxy/models/boox.dart';
import 'package:ibooxy/screens/home/boox_list.dart';
import 'package:ibooxy/services/auth.dart';
import 'package:ibooxy/util/constants.dart';

import 'package:ibooxy/services/database.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Boox>>.value(
      value: DatabaseService().booxs, //the stram
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: lighThemeColors,
          title: Text('Home'),
          elevation: 0.0,
          actions: <Widget>[
            FlatButton.icon(
              onPressed: () async {
                await this._auth.signOut();
              },
              icon: Icon(Icons.person),
              label: Text('Logout'),
            ),
          ],
        ),
        body: BooxList(),
      ),
    );
  }
}
