import 'dart:io';
import 'dart:math' as math;
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

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
