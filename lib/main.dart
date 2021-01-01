import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:snapper/Pages/mainPage.dart';
import 'Pages/MainPages/camera.dart';

import 'Pallete.dart';

Future<void> main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    cameras = await availableCameras();
  } on CameraException catch (e) {
    logError(e.code, e.description);
  }
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
      home: MainPage(),
    );
  }
}
