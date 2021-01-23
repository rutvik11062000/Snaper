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
    return GestureDetector(
      onTap: function,
      child: CircleAvatar(
        radius: size ?? 18,
        backgroundColor: Colors.transparent.withOpacity(.12),
        child: Center(
          child: Icon(
            iconData,
            color: color ?? white,
            size: 20,
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
