import 'package:flutter/material.dart';
import 'package:ibooxy/models/boox.dart';
import 'package:provider/provider.dart';

class BooxList extends StatefulWidget {
  @override
  _BooxListState createState() => _BooxListState();
}

class _BooxListState extends State<BooxList> {
  @override
  Widget build(BuildContext context) {
    final booxs = Provider.of<List<Boox>>(context);
    booxs.forEach((boox) {
      print(boox.name);
      print(boox.sugars);
      print(boox.strength);
    });
    return Container();
  }
}
