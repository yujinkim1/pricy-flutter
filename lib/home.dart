import 'package:flutter/material.dart';
import 'assets/colors/palette.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Mark1: Customize appBar
      appBar: AppBar(
        backgroundColor: Palette.screensColor,
        title: const Text(
          'Pricy',
          style: TextStyle(
              color: Palette.highLightColor,
              fontSize: 30,
              fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {
              //Mark4: onPressed ? popUpView
              print("Information button on pressed..");
            },
            icon: const Icon(
              Icons.info_outline,
              color: Palette.highLightColor,
              size: 30,
            ),
          ),
        ],
        centerTitle: false,
        elevation: 0,
        //Mark3: Create a bottom in tabBar and DefaultTabController
      ),
      body: SafeArea(
          //Mark2: Create tabBarView
          child: Text('This is home')),
    );
  }
}
