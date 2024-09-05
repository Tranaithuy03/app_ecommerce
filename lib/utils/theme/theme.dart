import 'package:app_my_pham/utils/theme/custom_themes/appbar_theme.dart';
import 'package:app_my_pham/utils/theme/custom_themes/bottom_sheet_theme.dart';
import 'package:app_my_pham/utils/theme/custom_themes/elevated_button_theme.dart';
import 'package:app_my_pham/utils/theme/custom_themes/outline_button_theme.dart';
import 'package:app_my_pham/utils/theme/custom_themes/text_field_theme.dart';
import 'package:app_my_pham/utils/theme/custom_themes/text_theme.dart';
import 'package:flutter/material.dart';

class MPAppTheme {
  MPAppTheme._(); //private constructor
  static ThemeData lightTheme = ThemeData(
      useMaterial3: true,
      fontFamily: 'Poppins',
      brightness: Brightness.light,
      primaryColor: Colors.lightBlue,
      //màu các phần chính nhu toolbar,...
      scaffoldBackgroundColor: Colors.white,
      textTheme: MPTextTheme.lightTextTheme,
      elevatedButtonTheme: MPElevatedButtonTheme.lightElevatedButtonTheme,
      appBarTheme: MPAppBarTheme.lightAppBarTheme,
      bottomSheetTheme: MPBottomSheetTheme.lightBottomSheetTheme,
      outlinedButtonTheme: MPOutlineButtonTheme.lightOutlineButtonTheme,
      inputDecorationTheme: MPTextFormFieldTheme.lightTextFormField);
  static ThemeData darkTheme = ThemeData(
      useMaterial3: true,
      fontFamily: 'Poppins',
      brightness: Brightness.dark,
      primaryColor: Colors.lightBlue,
      scaffoldBackgroundColor: Colors.black,
      textTheme: MPTextTheme.lightTextTheme,
      elevatedButtonTheme: MPElevatedButtonTheme.darkElevatedButtonTheme,
      appBarTheme: MPAppBarTheme.darkAppBarTheme,
      bottomSheetTheme: MPBottomSheetTheme.darkBottomSheetTheme,
      outlinedButtonTheme: MPOutlineButtonTheme.darkOutlineButtonTheme,
      inputDecorationTheme: MPTextFormFieldTheme.darkTextFormField);
}
