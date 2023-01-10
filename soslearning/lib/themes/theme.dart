import 'package:flutter/material.dart';
import 'package:soslearning/themes/text_style.dart';

import 'colors.dart';

@immutable
class AppTheme {
  static final color = AppColor();
  static final text = Apptext();

  AppTheme._();
  static ThemeData define() {
    return ThemeData(primaryColor: Color(0Xff428745));
  }
}
