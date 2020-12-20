import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:snapper/Pages/mainPage.dart';

import 'Pallete.dart';

CameraDescription firstCamera;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Obtain a list of the available cameras on the device.
  final cameras = await availableCameras();

  // Get a specific camera from the list of available cameras.
  firstCamera = cameras.first;
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
