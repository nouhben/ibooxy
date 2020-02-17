import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:ibooxy/models/boox.dart';
import 'package:ibooxy/screens/home/boox_list.dart';
import 'package:ibooxy/services/auth.dart';

import 'package:ibooxy/services/database.dart';
import 'package:ibooxy/util/constants.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    void _showSettingsPanel() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
              child: Text('bottom sheet'),
            );
          });
    }

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
            FlatButton.icon(
              onPressed: () => _showSettingsPanel(),
              icon: Icon(Icons.settings),
              label: Text('settings'),
            ),
          ],
        ),
        bottomNavigationBar: CurvedNavigationBar(
          buttonBackgroundColor: darkThemeColors,
          backgroundColor: lighThemeColors,
          items: <Widget>[
            Icon(
              Icons.add,
              size: 35.0,
              color: Colors.white,
            ),
            Icon(
              Icons.list,
              size: 35.0,
              color: Colors.white,
            ),
            Icon(
              Icons.compare_arrows,
              size: 35.0,
              color: Colors.white,
            ),
          ],
          onTap: (index) {
            //Handle button tap
          },
        ),
        body: BooxList(),
      ),
    );
  }
}
