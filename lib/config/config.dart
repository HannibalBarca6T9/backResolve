import 'package:flutter/material.dart';

class AppConst {
  static const url = "http://10.0.2.2:3000";
  static double getWidth(BuildContext context) {
    return MediaQuery.sizeOf(context).width;
  }
  static double getHeight(BuildContext context) {
    return MediaQuery.sizeOf(context).height;
  }
}
