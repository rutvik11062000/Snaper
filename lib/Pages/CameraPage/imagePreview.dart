import 'dart:io';
import 'dart:math' as math;
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:snapper/Pages/CameraPage/toSendListPage.dart';
import 'package:snapper/Pallete.dart';
import 'package:snapper/services/storageServices.dart';

class ImagePreview extends StatelessWidget {
  final bool ifFrontCamera;
  final double aspectRatio;
  final XFile xFile;
  const ImagePreview(
      {Key key, this.xFile, this.aspectRatio, this.ifFrontCamera})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Container(
        height: 50.0,
        color: Colors.black,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CustomFlatButton(
                  child: Icon(
                    FontAwesomeIcons.download,
                    color: white,
                  ),
                  function: () {},
                ),
                hspace10,
                CustomFlatButton(
                  child: Icon(
                    Icons.add_a_photo_outlined,
                    color: white,
                  ),
                  function: () {},
                )
              ],
            ),
            CustomFlatButton(
              color: yellow,
              function: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ToSendList())),
              child: Row(
                children: [
                  Text(
                    "Send To",
                    style:
                        TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
                  ),
                  Icon(Icons.send)
                ],
              ),
            ),
          ],
        ),
      ),
      body: ifFrontCamera
          ? Transform(
              alignment: Alignment.center,
              transform: Matrix4.rotationY(math.pi),
              child: BaseWidget(aspectRatio: aspectRatio, xFile: xFile),
            )
          : BaseWidget(aspectRatio: aspectRatio, xFile: xFile),
    );
  }
}

class CustomFlatButton extends StatelessWidget {
  final Function function;
  // final IconData;
  final Widget child;
  final Color color;

  const CustomFlatButton({
    Key key,
    this.function,
    this.child,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: function,
      shape:
          RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
      color: color ?? Colors.white.withOpacity(0.12),
      child: child,
      // child: Icon(
      //   Icons.add_a_photo_outlined,
      //   color: white,
      // ),
    );
  }
}

class BaseWidget extends StatelessWidget {
  const BaseWidget({
    Key key,
    @required this.aspectRatio,
    @required this.xFile,
  }) : super(key: key);

  final double aspectRatio;
  final XFile xFile;

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 1 / aspectRatio * 1.114,
      child: AspectRatio(
        aspectRatio: aspectRatio,
        child: Image.file(File(xFile.path)),
      ),
    );
  }
}
