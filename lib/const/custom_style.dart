import 'package:flutter/material.dart';

class CustomStyle {
  static double fontSizeHeader = 19;
  static double fontSizeJumbo = 26;
  static double fontSizeTitle = 18;
  static double fontSizeSubTitle = 17;
  static double fontSizeNormal = 16;
  static double fontSizeSmall = 14;
  static double horizontalMargin = 15;
  static double topMarginPage = 24;
  static int decimalPlaces = 3;
  static var mainColor = const Color(0xff8B4513);
  static var tabButtonColor = const Color(0xff8093AB);
  static var secondaryColor = const Color(0xffffdd53);
  static var tertiaryColor = const Color(0xff314488);
  static var colorBC = const Color(0xff26C89B);
  static var colorRed = const Color(0xffCC4343);
  static var colorGreen = const Color(0xff23BE5B);
  static var colorOrange = const Color(0xffF17F1B);
  static var colorLightOrange = const Color(0xffFCB544);
  static var backgroundColor = Colors.white;
  static var fontColorBlack = Colors.grey[800];
  static var fontColorGrey = Colors.grey[600];
  static var boxDecoration = BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.08),
          spreadRadius: 1.6,
          blurRadius: 4,
          offset: const Offset(0, 1), // changes position of shadow
        ),
      ],
      color: Colors.white,
      borderRadius: const BorderRadius.all(Radius.circular(12),)
  );
}