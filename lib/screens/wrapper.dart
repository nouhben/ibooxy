import 'package:flutter/material.dart';
import 'package:ibooxy/models/user.dart';
import 'package:ibooxy/screens/authenticate/authenticate.dart';
import 'package:ibooxy/screens/home/home.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    print(user);
    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
    //Home or Authenticate widget
    //return Home();
    //return Authenticate();
  }
}
