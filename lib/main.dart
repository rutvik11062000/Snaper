import 'package:camera/camera.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:snapper/Pages/mainPage.dart';
import 'Pages/CameraPage/camera.dart';

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
    final Future<FirebaseApp> _initialization = Firebase.initializeApp();

    return FutureBuilder(
      future: _initialization,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasError)
          return Container(
            child: Text("Error!"),
          );

        if (snapshot.connectionState == ConnectionState.done)
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              primaryColor: yellow,
              fontFamily: 'Avenier',
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            home: MainPage(),
          );

        return CircularProgressIndicator();
      },
    );
  }
}
