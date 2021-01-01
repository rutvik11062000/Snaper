import 'package:flutter/material.dart';

import '../../Pallete.dart';

class BuildOpacityButton extends StatelessWidget {
  const BuildOpacityButton({
    Key key,
    @required this.iconData,
    this.color,
  }) : super(key: key);

  final IconData iconData;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 18.0,
      backgroundColor: Colors.transparent.withOpacity(.12),
      child: Center(
        child: Icon(
          iconData,
          color: color ?? white,
          size: 18,
        ),
      ),
    );
  }
}

class BuildButton extends StatelessWidget {
  const BuildButton({
    Key key,
    @required this.iconData,
  }) : super(key: key);

  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.transparent,
      child: Icon(
        iconData,
        color: white,
      ),
    );
  }
}
