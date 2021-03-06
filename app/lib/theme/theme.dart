
import 'package:flutter/material.dart';
import 'colors.dart';

final ThemeData smartTheme = _buildSmartTheme();

ThemeData _buildSmartTheme() {
  final ThemeData base = ThemeData.light();

return base.copyWith(
    primaryColor: primaryColor,
    accentColor: secondaryColor,
    errorColor: tertiartColor,
    primaryColorDark: darkColor,
    primaryColorLight: Colors.white,
    cardColor: lightColor,
    buttonTheme: base.buttonTheme.copyWith(
        buttonColor: secondaryColor,
        textTheme: ButtonTextTheme.primary,
        disabledColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        minWidth: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 16)),
    scaffoldBackgroundColor: Colors.white,
    canvasColor: Colors.transparent,
    cardTheme: CardTheme(
      color: lightColor,
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(7),
      ),
    ),

    textTheme: TextTheme(
      headline1: TextStyle(
        fontFamily: 'Roboto',
        fontSize: 32,
        fontWeight: FontWeight.w600,
        color: primaryColor,
      ),

      headline2: TextStyle(
        fontFamily: 'Roboto',
        fontSize: 24,
        color: darkColor,
      ),

      headline3: TextStyle(
        fontFamily: 'Roboto',
        fontSize: 16,
        color: darkColor,
        fontWeight: FontWeight.w600,
      ),
      headline4: TextStyle(
        fontFamily: 'Roboto',
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: primaryColor,
      ),
      
    ),
  );
}