import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:snapper/UI/shared/CustomButton.dart';

import '../../Pallete.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: loadingColor,
      ),
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                flex: 5,
                child: Container(
                  width: 150,
                  height: 150,
                  child: SvgPicture.asset(
                    // 'svg/icons8-snapchat.svg',
                    'svg/snapchat-logo.svg',
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 60.0, vertical: 20.0),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 48.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CustomButton(
                            bgColor: white,
                            content: "Log In",
                            txtColor: black,
                          ),
                          CustomButton(
                              bgColor: blue,
                              content: "Sign Up",
                              txtColor: white),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
