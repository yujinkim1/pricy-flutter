import 'package:flutter/material.dart';
import '../assets/colors/palette.dart';

class Styles {
  //MARK: -itemName
  static const TextStyle itemNameText = TextStyle(
      color: Palette.elementColor, fontSize: 18, fontWeight: FontWeight.w600);
  //MARK: -unit
  static const TextStyle unitText = TextStyle(
      color: Palette.elementColor, fontSize: 15, fontWeight: FontWeight.w300);
  //MARK: -dpr1
  static const TextStyle dprText = TextStyle(
      color: Palette.elementColor, fontSize: 20, fontWeight: FontWeight.bold);
  static const TextStyle dprUpText = TextStyle(
      color: Color.fromARGB(255, 222, 106, 145),
      fontSize: 22,
      fontWeight: FontWeight.bold);
  static const TextStyle dprDownText = TextStyle(
      color: Color.fromARGB(255, 61, 174, 255),
      fontSize: 22,
      fontWeight: FontWeight.w600);
  static const TextStyle resultText = TextStyle(
      color: Palette.whiteLabelColor,
      fontSize: 22,
      fontWeight: FontWeight.bold);
  //MARK: -AlertDialog
  static const TextStyle appInfoText = TextStyle(
    color: Palette.elementColor,
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );
}
