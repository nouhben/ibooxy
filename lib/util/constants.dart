import 'package:flutter/material.dart';

const String appName = 'iBooxy';

//Colors for theme
const Color buttonsColor = Color(0xff0F6CFB);
const Color buttonsSecondaryColor = Color(0xff1F4A77);
const Color darkThemeColors = Color(0xff0B1824);
const Color lighThemeColors = Color(0xffFAFAFA);

const textInputDecoration = InputDecoration(
  fillColor: Color(0xffFAFAFA),
  filled: true,
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Color(0xff0B1824),
      width: 0.0,
    ),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Color(0xff0B1824), width: 1.0),
  ),
);
