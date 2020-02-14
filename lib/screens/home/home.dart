import 'package:flutter/material.dart';
import 'package:ibooxy/services/auth.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
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
    );
  }
}
