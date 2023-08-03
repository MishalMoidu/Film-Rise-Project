import 'package:flutter/material.dart';

class AppUtils {
  static double sw(double width, BuildContext context) {
    return MediaQuery.of(context).size.width * (width / 360.0);
  }

  static double sh(double height, BuildContext context) {
    return MediaQuery.of(context).size.height * (height / 787.6666666666666);
  }
}
