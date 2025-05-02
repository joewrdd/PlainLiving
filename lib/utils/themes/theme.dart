import 'package:flutter/material.dart';
import 'package:plainliving/utils/constants/colors.dart';
import 'package:plainliving/utils/themes/custom/appbar_theme.dart';
import 'package:plainliving/utils/themes/custom/bottom_sheet_theme.dart';
import 'package:plainliving/utils/themes/custom/checkbox_theme.dart';
import 'package:plainliving/utils/themes/custom/chip_theme.dart';
import 'package:plainliving/utils/themes/custom/elevated_button_theme.dart';
import 'package:plainliving/utils/themes/custom/outlined_buttom_theme.dart';
import 'package:plainliving/utils/themes/custom/text_field_theme.dart';
import 'package:plainliving/utils/themes/custom/text_theme.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme = ThemeData(
    fontFamily: 'SourceSansPro',
    brightness: Brightness.light,
    primaryColor: ConstantColors.darkNavy,
    scaffoldBackgroundColor: ConstantColors.white,
    textTheme: CustomTextTheme.lightTextTheme,
    chipTheme: CustomChipTheme.lightChipTheme,
    appBarTheme: CustomAppBarTheme.lightAppBarTheme,
    checkboxTheme: CustomCheckboxTheme.lightCheckboxTheme,
    bottomSheetTheme: CustomBottomSheetTheme.lightBottomSheetTheme,
    elevatedButtonTheme: CustomElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: CustomOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: CustomTextFormFieldTheme.lightInputDecorationTheme,
    textSelectionTheme: TextSelectionThemeData(
      selectionColor: Colors.black.withOpacity(0.5),
      cursorColor: ConstantColors.dark,
      selectionHandleColor: Colors.black,
    ),
  );
  static ThemeData darkTheme = ThemeData(
    fontFamily: 'SourceSansPro',
    brightness: Brightness.dark,
    primaryColor: ConstantColors.darkNavy,
    scaffoldBackgroundColor: ConstantColors.black,
    textTheme: CustomTextTheme.darkTextTheme,
    chipTheme: CustomChipTheme.darkChipTheme,
    appBarTheme: CustomAppBarTheme.darkAppBarTheme,
    checkboxTheme: CustomCheckboxTheme.darkCheckboxTheme,
    bottomSheetTheme: CustomBottomSheetTheme.darkBottomSheetTheme,
    elevatedButtonTheme: CustomElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: CustomOutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: CustomTextFormFieldTheme.darkInputDecorationTheme,
    textSelectionTheme: TextSelectionThemeData(
      selectionColor: Colors.white.withOpacity(0.5),
      cursorColor: ConstantColors.white,
      selectionHandleColor: Colors.white,
    ),
  );
}
