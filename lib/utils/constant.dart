import 'package:flutter/material.dart';

class Constant {
  static double dh(BuildContext context) {
    return MediaQuery.sizeOf(context).height;
  }

  static double dw(BuildContext context) {
    return MediaQuery.sizeOf(context).width;
  }
}
