import 'package:flutter/material.dart';
import 'screens/home.dart';
import 'assets/colors/palette.dart';

void main() {
  runApp(const MyApp());
}

//MARK: ROOT WIDGET
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pricy',
      theme: ThemeData(
          scaffoldBackgroundColor: Palette.screensColor,
          fontFamily: 'NotoSans'),
      home: const HomePage(),
    );
  }
}
