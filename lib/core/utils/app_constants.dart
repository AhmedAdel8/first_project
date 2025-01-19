import 'package:flutter/material.dart';

class AppConstants {
  static String? userToken;

  static final navigatorKey = GlobalKey<NavigatorState>();

  static screenWidth(context) => MediaQuery.sizeOf(context).width;

  static screenHeight(context) => MediaQuery.sizeOf(context).height;

}