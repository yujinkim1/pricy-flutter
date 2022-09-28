import 'package:flutter/material.dart';

//Mark1: Customize Colors
class Palette {
  /* Mark2: primarySwatch가 필요한 경우
  static const MaterialColor colorSet = const MaterialColor(
    0xffe8eaf6,
    const <int, Color>{
      50: const Color(0xffe8eaf6),
      100: const Color(0xffc5cae9),
      200: const Color(0xff9fa8da),
      300: const Color(0xff7986cb),
      400: const Color(0xff5c6bc0),
      500: const Color(0xff3f51b5),
      600: const Color(0xff3949ab),
      700: const Color(0xff303f9f),
      800: const Color(0xff283593),
      900: const Color(0xff1a237e),
    },
  );
  */
  //Mark3: 컬러코드를 그대로 전달하지 않고 정적 상수를 사용해 직관적인 코드를 생성
  static const screensColor = Color(0xfff1f4f8);
  static const normalTextColor = Color(0xffc5cae9);
  static const highLightColor = Color(0xff3949ab);
  static const containersColor = Color(0xff9fa8da);
  static const tabLabelColor = Color(0xFF304FFE);
}
