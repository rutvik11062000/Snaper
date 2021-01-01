import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:snapper/Pallete.dart';
import 'package:snapper/UI/shared/CustomButton.dart';

class Login extends StatelessWidget {
  const Login({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: white,
      ),
      child: Scaffold(
        body: SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  splashColor: Colors.transparent,
                  icon: Icon(
                    Icons.arrow_back_ios_rounded,
                    size: 18.0,
                    color: Colors.black87,
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Container(
                      height: 250,
                      width: MediaQuery.of(context).size.width,
                      // color: Colors.green,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Text(
                              "Log In",
                              style: TextStyle(
                                fontSize: 25.0,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 40.0, vertical: 8.0),
                            child: TextField(
                              cursorColor: Colors.green,
                              cursorWidth: 3.0,
                              decoration: InputDecoration(
                                labelText: "USER NAME OR EMAIL",
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                                labelStyle:
                                    TextStyle(color: blue, fontSize: 13.0),
                                focusColor: black,
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: black),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 40.0, vertical: 10.0),
                            child: TextField(
                              obscureText: true,
                              // obscuringCharacter: "*",
                              cursorColor: Colors.green,
                              cursorWidth: 3.0,
                              decoration: InputDecoration(
                                labelText: "PASSWORD",
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                                labelStyle:
                                    TextStyle(color: blue, fontSize: 13.0),
                                focusColor: black,
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: black),
                                ),
                                suffixIcon: Icon(
                                  Icons.lock,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Center(
                            child: Text(
                              "Forgot your password?",
                              style: TextStyle(color: blue),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    // height: 30,
                    padding: EdgeInsets.only(bottom: 20.0),
                    child: CustomButton(
                        bgColor: Colors.blue,
                        content: "Log In",
                        txtColor: white,
                        width: 200),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
