import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:snapper/Pages/LoginPage/loginPage.dart';
import 'package:snapper/Pages/SignUpPage/signUpPage.dart';
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
                            function: () =>
                                Navigator.of(context).push(_createRoute(0)),
                          ),
                          CustomButton(
                            bgColor: blue,
                            content: "Sign Up",
                            txtColor: white,
                            function: () =>
                                Navigator.of(context).push(_createRoute(1)),
                          ),
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

  void navigateToLogin(BuildContext context) {
    print("press");
    Navigator.push(
      context,
      MaterialPageRoute(builder: (BuildContext context) => Login()),
    );
  }
}

Route _createRoute(int idx) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) =>
        idx == 0 ? Login() : SignUp(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(1.0, 0.0);
      var end = Offset.zero;
      var curve = Curves.linear;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
