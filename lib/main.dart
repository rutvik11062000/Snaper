import 'package:flutter/material.dart';
import 'package:snapper/Pages/LoginPage/loginPage.dart';

import 'Pallete.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // primarySwatch: MaterialColor(Color(0xFFB74093), swatch),
        primaryColor: yellow,
        // accentColor: Colors.red,
        fontFamily: 'Avenier',
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Login(),
    );
  }
}
