import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:snapper/Pallete.dart';
import 'package:snapper/UI/shared/CustomCircleAvatarOpacity.dart';
import 'package:snapper/main.dart';

class Camera extends StatefulWidget {
  const Camera({Key key}) : super(key: key);

  @override
  _CameraState createState() => _CameraState();
}

class _CameraState extends State<Camera> with TickerProviderStateMixin {
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
  CameraController _controller;
  Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();

    _controller = CameraController(
      firstCamera,
      ResolutionPreset.medium,
    );

    // Next, initialize the controller. This returns a Future.
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed.
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.camera_alt),
      //   // Provide an onPressed callback.
      //   onPressed: () async {
      //     try {
      //       await _initializeControllerFuture;
      //       final path = join(
      //         (await getTemporaryDirectory()).path,
      //         '${DateTime.now()}.png',
      //       );
      //       await _controller.takePicture(path);
      //     } catch (e) {
      //       print(e);
      //     }
      //   },
      // ),
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // If the Future is complete, display the preview.
            return Stack(
              children: [
                CameraPreview(_controller),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SafeArea(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            BuildOpacityButton(iconData: Icons.person),
                            hspace5,
                            BuildOpacityButton(iconData: Icons.search_outlined),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BuildOpacityButton(
                                iconData: Icons.person_add_alt_1),
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
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return BuildButton(
                                            iconData: icons[index]);
                                      },
                                    ),
                                  ),
                                  IconButton(
                                    icon: Icon(
                                      min
                                          ? Icons.arrow_downward
                                          : Icons.arrow_upward,
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
                        BuildOpacityButton(
                            iconData: Icons.card_giftcard_rounded),
                        hspace10,
                        Container(
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
                        hspace10,
                        BuildOpacityButton(iconData: Icons.timer),
                      ],
                    ),
                  ),
                ),
              ],
            );
          } else {
            // Otherwise, display a loading indicator.
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
