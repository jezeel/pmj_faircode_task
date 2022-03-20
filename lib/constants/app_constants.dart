import 'package:flutter/material.dart';




abstract class RoutePaths {
  static const String LoginScreen = '/';
  static const String HomeScreen = '/home';
  static const String ProfileScreen = '/profile';

}

abstract class Prefs {
  bool isChecked = false;
  bool loginStatus = false;
}




abstract class BookingStatus {
  static const String HeadingColor = 'HeadingColor';
  static const String TextColor = 'TextColor';
  static const String BackgroundColor = 'BackgroundColor';
  static const String ButtonColor = 'ButtonColor';
  static const String ShapeColor = 'ShapeColor';

  static Color colorOf(String status) {
    switch (status) {
      case HeadingColor:
        return const Color(0xff004d40);
      case TextColor:
        return const Color(0xff006064);
      case BackgroundColor:
        return const Color(0xffcfd8dc);
      case ButtonColor:
        return const Color(0xffffa726);
      case ShapeColor:
        return const Color(0x4dffffff);
      default:
        return const Color(0xff080808);
    }
  }
}