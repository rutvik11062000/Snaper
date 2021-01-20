import 'package:flutter/material.dart';

import '../../Pallete.dart';

class BuildOpacityButton extends StatelessWidget {
  const BuildOpacityButton({
    Key key,
    @required this.iconData,
    this.color,
    this.size,
    this.function,
  }) : super(key: key);

  final IconData iconData;
  final Color color;
  final double size;
  final Function function;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: function,
      icon: CircleAvatar(
        radius: size ?? 18.0,
        backgroundColor: Colors.transparent.withOpacity(.12),
        child: Center(
          child: Icon(
            iconData,
            color: color ?? white,
            size: 22,
          ),
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
