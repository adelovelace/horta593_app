import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GlobalVariables {
  static const appBarGradient = LinearGradient(colors: [
    Color.fromARGB(255, 29, 201, 192),
    Color.fromARGB(255, 125, 221, 216)
  ], stops: [
    0.5,
    1.0
  ]);

  static const Color secondaryColor = Color(0xff73CC6B);
  static const Color primarybackground = Color(0xff1e1e1e);
  static const Color whitebackgound = Color(0xffeae8ee);
  static const Color greyGaluchi = Color(0xffB0AEAF);
  static const selectedNavBarColor = Colors.cyan;
  static const unselectedNavBarColor = Colors.black87;
}
