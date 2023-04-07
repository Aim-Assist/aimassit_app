import 'package:flutter/material.dart';
import 'package:loginsys/src/utils/theme/text_theme.dart';

// Custom theme class
class TAppTheme {
  TAppTheme._();

  static ThemeData get lightTheme => ThemeData(
        brightness: Brightness.light,
        textTheme: TText.lightTheme,


      );

  static ThemeData get darkTheme => ThemeData(
        brightness: Brightness.dark,
        textTheme: TText.darkTheme,
      );
}
