import 'package:flutter/material.dart';

import '../../Pallete.dart';

class BuildOpacityButton extends StatelessWidget {
  const BuildOpacityButton({
    Key key,
    @required this.iconData,
  }) : super(key: key);

  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.transparent.withOpacity(.3),
      child: Icon(
        iconData,
        color: white,
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
