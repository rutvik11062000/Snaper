import 'package:flutter/material.dart';
import 'package:snapper/Pallete.dart';

class TopPaddingComponent extends StatelessWidget {
  final Widget child;
  const TopPaddingComponent({Key key, @required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: child,
        ),
      ),
    );
  }
}
