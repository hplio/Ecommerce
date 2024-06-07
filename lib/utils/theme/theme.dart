import 'package:flutter/material.dart';
import 'package:to_do/utils/theme/text_theme.dart';
import 'package:to_do/utils/theme/elevated_button_theme.dart';
import 'package:to_do/utils/theme/appbar_theme.dart';
import 'package:to_do/utils/theme/bottom_sheet_theme.dart';
import 'package:to_do/utils/theme/checkbox_theme.dart';
import 'package:to_do/utils/theme/chip_theme.dart';
import 'package:to_do/utils/theme/outlined_button_theme.dart';
import 'package:to_do/utils/theme/input_decoration_theme.dart';

class ThemeDesinge {
  ThemeDesinge._();
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'poppins',
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    primaryColor: Colors.blueAccent,
    textTheme: TTextTheme.lightTextTheme,
    elevatedButtonTheme: TElevetedButtonTheme.lightElevetedButtonTheme,
    appBarTheme: TAppbarTheme.lightAppbarTheme,
    bottomSheetTheme: TBottomSheetTheme.lightBottomSheetTheme,
    checkboxTheme: TCheckBoxTheme.lightCheckBoxTheme,
    chipTheme: TChipTheme.lightChipTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: TInputDecorationTheme.lightInputDecotation,
  );
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'poppins',
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.black,
    primaryColor: Colors.blueAccent,
    textTheme: TTextTheme.darkTextTheme,
    elevatedButtonTheme: TElevetedButtonTheme.darkElevetedButtonTheme,
    appBarTheme: TAppbarTheme.darkAppbarTheme,
    bottomSheetTheme: TBottomSheetTheme.darkBottomSheetTheme,
    checkboxTheme: TCheckBoxTheme.darkCheckBoxTheme,
    chipTheme: TChipTheme.darkChipTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: TInputDecorationTheme.darkInputDecotation,
  );
}
