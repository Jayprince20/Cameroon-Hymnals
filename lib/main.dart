import 'package:cameroon_hymnal/Screens/DetailPage.dart';
import 'package:cameroon_hymnal/Screens/HomePage.dart';
import 'package:flutter/material.dart';
// import 'package:splashscreen/splashscreen.dart';
import 'package:get/get.dart';
import 'Screens/WelcomePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomePage(),
      theme: _lightTheme,
      darkTheme: _darkTheme,
      themeMode: ThemeMode.system,
      routes: {
        HomePage.routeName: (context) => HomePage(),
        DetailPage.routeName: (context) => DetailPage(),
      },
    );
  }
}

ThemeData _darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.white,
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.white,
      disabledColor: Colors.grey,
    ));

ThemeData _lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.white,
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.blue,
      disabledColor: Colors.grey,
    ));
