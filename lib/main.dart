import 'package:flutter/material.dart';
import 'package:paytm_demo/Screen/Home_Screen.dart';
import 'package:paytm_demo/Screen/Intro_Screen.dart';
import 'package:paytm_demo/Screen/Login_Screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home_Screen(),
    );
  }
}
