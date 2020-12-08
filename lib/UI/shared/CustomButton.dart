import 'package:flutter/material.dart';

import '../../Pallete.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key key,
    @required this.bgColor,
    @required this.content,
    @required this.txtColor,
    this.width,
  }) : super(key: key);

  final Color bgColor;
  final String content;
  final Color txtColor;
  final double width;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(30.0)),
      color: bgColor,
      onPressed: () {},
      child: Container(
        width: width ?? 90.0,
        child: Center(
          child: Text(
            content,
            style:
                TextStyle(fontWeight: boldTS, color: txtColor, fontSize: 15.0),
          ),
        ),
      ),
    );
  }
}
