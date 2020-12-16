import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pdp_ui4/intropage_ui.dart';
import 'package:pdp_ui4/loginpage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: IntroPage(),
      routes: {
        IntroPage.id: (context) => IntroPage(),
        LoginPage.id: (context) => LoginPage(),
      },
    );
  }
}
