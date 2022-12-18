import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:yaml/yaml.dart';
import 'screens/home.dart';
import 'assets/colors/palette.dart';

//MARK: GET HIDED CERTIFICATE
void main() async {
  //MARK: REQUIRED BY FLUTTER CONFIG
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterConfig.loadEnvVariables();
  runApp(const MyApp());
  //MARK: LOAD TO YAML DATA OF VERSION
  rootBundle.loadString("pubspec.yaml").then((yamlValue) {
    var yaml = loadYaml(yamlValue);
    var version = yaml["version"];
    print(version);
  });
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
