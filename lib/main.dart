import 'package:flutter/material.dart';
import 'package:widgets_book/Constants/color.dart';
import 'package:widgets_book/Screens/home_page.dart';
import 'package:widgets_book/Screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      color:  kMediumBlueColor,
      theme: ThemeData(
          accentColor: kMediumBlueColor,
          fontFamily: 'Ubuntu'
      ),
      home: SplashScreen(),
    );
  }
}
