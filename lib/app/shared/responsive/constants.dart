import 'package:flutter/material.dart';

class Constants {
  static const TextStyle textCardTitle = TextStyle(
      fontSize: 20,
      fontFamily: "Ubuntu",
      color: Color.fromARGB(255, 42, 118, 108));
  static const TextStyle textListItens = TextStyle(
      fontSize: 13,
      color: Colors.black,
      fontWeight: FontWeight.w600,
      fontFamily: "Ubuntu");

  static const TextStyle textTitleOnboarding = TextStyle(
      fontSize: 30,
      color: Color.fromARGB(255, 5, 103, 101),
      fontFamily: "Museo",
      fontWeight: FontWeight.w700);

  static const TextStyle subTextTitleOnboarding = TextStyle(
      fontSize: 24,
      color: Color.fromARGB(255, 5, 103, 101),
      fontFamily: "Museo",
      fontWeight: FontWeight.w300);

  static const TextStyle textTitlePages = TextStyle(
      fontSize: 17,
      color: Colors.white,
      fontFamily: "Museo",
      fontWeight: FontWeight.w400);

  static const TextStyle textButtonWhite = TextStyle(
      fontSize: 20,
      color: Colors.white,
      fontFamily: "Museo",
      fontWeight: FontWeight.w400);

  static const TextStyle textToFormFields = TextStyle(
      fontSize: 16,
      color: Colors.black87,
      fontFamily: "Ubuntu",
      fontWeight: FontWeight.w300);

  static const TextStyle textUnderlineViewItens = TextStyle(
      fontSize: 13,
      color: Colors.blue,
      fontFamily: "Ubuntu",
      fontWeight: FontWeight.w300,
      decoration: TextDecoration.underline);

  static const TextStyle textToFormFieldsINPUT = TextStyle(
      fontSize: 16,
      color: Colors.black,
      fontFamily: "Ubuntu",
      fontWeight: FontWeight.w500);

  static const TextStyle textListItensAdd = TextStyle(
      fontSize: 13, fontFamily: "Ubuntu", fontWeight: FontWeight.w500);

  static const double kPadding = 10.0;
  static const Color corPrimaria = Color.fromARGB(255, 18, 153, 153);
  static const Color corSecundaria = Color.fromARGB(255, 255, 255, 255);
  static const Color backgroundGradientMenu1 = Color(0XFFec8d2f);
  static const Color backgroundGradientMenu2 = Color(0XFFf44336);
  static const Color backgroundGradientMenu3 =
      Color.fromARGB(255, 117, 73, 240);

  static const Color backgroundAvatarCircle =
      Color.fromARGB(255, 255, 255, 255);

  /// Package: Primary Colors
  static const MaterialColor corItensApp = MaterialColor(
    corItensApp1,
    <int, Color>{
      50: corPrimaria,
      100: corPrimaria,
      200: corPrimaria,
      300: corPrimaria,
      400: corPrimaria,
      500: corPrimaria,
      600: corPrimaria,
      700: corPrimaria,
      800: corPrimaria,
      900: corPrimaria,
    },
  );
  static const corItensApp1 = 0xFF000000;
}
