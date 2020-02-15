import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:ibooxy/util/constants.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: lighThemeColors,
      child: Center(
        child: SpinKitChasingDots(color: buttonsColor, size: 50.0),
      ),
    );
  }
}
