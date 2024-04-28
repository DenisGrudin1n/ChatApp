import 'package:chatapp/constants/constants.dart';
import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  colorScheme: ColorScheme.light(
    background: Colors.grey.shade300,
    primary: Colors.grey.shade500,
    secondary: kBlack,
    tertiary: kWhite,
    inversePrimary: lightBlue,
  ),
  primaryColor: Colors.grey.shade400,
  highlightColor: lightPurple,
);

ThemeData darkMode = ThemeData(
  colorScheme: ColorScheme.dark(
    background: Colors.grey.shade800,
    primary: Colors.grey.shade600,
    secondary: kWhite,
    tertiary: kBlack,
    inversePrimary: darkBlue,
  ),
  primaryColor: Colors.grey.shade600,
  highlightColor: darkPurple,
);
