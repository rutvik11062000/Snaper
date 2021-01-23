import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:snapper/Pages/CameraPage/imagePreview.dart';
import 'package:snapper/Pages/MainPages/memories.dart';
import 'package:snapper/Pages/MainPages/search.dart';
import 'package:snapper/Pallete.dart';
import 'package:snapper/UI/shared/AppBarConstWidget.dart';
import 'package:snapper/UI/shared/CustomCircleAvatarOpacity.dart';

List<CameraDescription> cameras = [];

void logError(String code, String message) =>
    print('Error: $code\nError Message: $message');

class Camera extends StatefulWidget {
  const Camera({Key key}) : super(key: key);

  @override
  _CameraState createState() => _CameraState();
}

class _CameraState extends State<Camera>
    with TickerProviderStateMixin, WidgetsBindingObserver {
  IconData iconData = Icons.person;
  List<IconData> icons = [
    Icons.camera_rear_outlined,
    Icons.flash_off_rounded,
    Icons.layers,
    Icons.timer_rounded,
    Icons.center_focus_strong,
    Icons.grid_on_outlined
  ];

  bool min = true;
  bool cam = true;
  XFile imageFile;
  CameraController controller;

  @override
  void initState() {
    super.initState();
    onNewCameraSelected(cameras.first);

    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (controller == null || !controller.value.isInitialized) {
      return;
    }
    if (state == AppLifecycleState.inactive) {
      controller?.dispose();
    } else if (state == AppLifecycleState.resumed) {
      if (controller != null) {
        onNewCameraSelected(controller.description);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          buildGestureDetector(context),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SafeArea(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppBarConstWidget(),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BuildOpacityButton(iconData: Icons.person_add_alt_1),
                      hspace5,
                      Container(
                        padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                        decoration: BoxDecoration(
                          color: Colors.transparent.withOpacity(0.3),
                          borderRadius: BorderRadius.all(
                            Radius.circular(45.0),
                          ),
                        ),
                        width: 45,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            AnimatedSize(
                              curve: Curves.easeInOut,
                              vsync: this,
                              duration: Duration(milliseconds: 300),
                              child: ListView.separated(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: min ? 2 : 5,
                                separatorBuilder:
                                    (BuildContext context, int index) {
                                  return SizedBox(
                                    height: 5.0,
                                  );
                                },
                                itemBuilder: (BuildContext context, int index) {
                                  return BuildButton(iconData: icons[index]);
                                },
                              ),
                            ),
                            IconButton(
                              icon: Icon(
                                min ? Icons.arrow_downward : Icons.arrow_upward,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                setState(() {
                                  min = !min;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BuildOpacityButton(iconData: Icons.card_giftcard_rounded),
                  hspace10,
                  GestureDetector(
                    onTap: () async {
                      try {
                        imageFile = await controller.takePicture();
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (BuildContext context) {
                            return ImagePreview(
                              xFile: imageFile,
                              aspectRatio: controller.value.aspectRatio,
                              ifFrontCamera:
                                  controller.description != cameras.first,
                            );
                          }),
                        );
                      } catch (e) {
                        print(e);
                      }
                    },
                    child: Container(
                      width: 90,
                      height: 90,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: white,
                          width: 4.0,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(100),
                        ),
                      ),
                    ),
                  ),
                  hspace10,
                  BuildOpacityButton(iconData: Icons.timer),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void onNewCameraSelected(CameraDescription cameraDescription) async {
    if (controller != null) {
      await controller.dispose();
    }
    controller = CameraController(
      cameraDescription,
      ResolutionPreset.medium,
      // enableAudio: enableAudio,
    );

    // If the controller is updated then update the UI.
    controller.addListener(() {
      if (mounted) setState(() {});
      if (controller.value.hasError) {
        // showInSnackBar('Camera error ${controller.value.errorDescription}');
        print("Error");
      }
    });

    try {
      await controller.initialize();
      // _maxAvailableZoom = await controller.getMaxZoomLevel();
      // _minAvailableZoom = await controller.getMinZoomLevel();
    } on CameraException catch (e) {
      // _showCameraException(e);
      print("Camera exceptiopn");
    }

    if (mounted) {
      setState(() {});
    }
  }

  Widget buildGestureDetector(BuildContext context) {
    if (controller == null || !controller.value.isInitialized) {
      return const Text(
        'Tap a camera',
        style: TextStyle(
          color: Colors.white,
          fontSize: 24.0,
          fontWeight: FontWeight.w900,
        ),
      );
    } else
      return GestureDetector(
        onDoubleTap: () {
          onNewCameraSelected(
              controller.description == cameras[0] ? cameras[1] : cameras[0]);
          // print(cameras);
        },
        onPanUpdate: (details) {
          if (details.delta.dy < -10) Navigator.push(context, _createRoute());

          if (details.delta.dy > 10) Navigator.push(context, _createRoute1());
        },
        child: Transform.scale(
          scale: 1 / controller.value.aspectRatio,
          child: AspectRatio(
              aspectRatio: controller.value.aspectRatio,
              child: CameraPreview(controller)),
        ),
      );
  }

  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => Memories(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(0.0, 1.0);
        var end = Offset(0, 0);
        var curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  Route _createRoute1() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => Search(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var curve = Curves.ease;

        var tween = Tween(begin: Offset(0.0, -1.0), end: Offset(0.0, 0.0))
            .chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}
