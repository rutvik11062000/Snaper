import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:snapper/Pages/MainPages/accountPage.dart';
import 'package:snapper/UI/shared/CustomCircleAvatarOpacity.dart';

import '../../Pallete.dart';

class AppBarConstWidget extends StatelessWidget {
  const AppBarConstWidget({Key key, this.specificColor}) : super(key: key);
  final Color specificColor;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "TOPBUTTONS",
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          BuildOpacityButton(
            function: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => AccountPage())),
            iconData: Icons.person,
            color: specificColor,
          ),
          hspace10,
          BuildOpacityButton(
            iconData: FontAwesomeIcons.search,
            color: specificColor,
          ),
        ],
      ),
    );
  }
}
