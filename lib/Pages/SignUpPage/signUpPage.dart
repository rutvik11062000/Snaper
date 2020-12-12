import 'package:flutter/material.dart';
import 'package:snapper/Pallete.dart';
import 'package:snapper/UI/shared/CustomButton.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  color: Colors.grey,
                ),
              ),
              Expanded(
                child: Center(
                  child: Container(
                    height: 300,
                    width: MediaQuery.of(context).size.width,
                    // color: Colors.green,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Text(
                            "What's your name?",
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
                              labelText: "First Name",
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              labelStyle:
                                  TextStyle(color: blue, fontSize: 16.0),
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
                            // obscureText: true,
                            // obscuringCharacter: "*",
                            cursorColor: Colors.green,
                            cursorWidth: 3.0,
                            decoration: InputDecoration(
                              labelText: "LastName",
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              labelStyle:
                                  TextStyle(color: blue, fontSize: 16.0),
                              focusColor: black,
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: black),
                              ),
                              // suffixIcon: Icon(
                              //   Icons.lock,
                              //   color: Colors.grey,
                              // ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 40.0, vertical: 10.0),
                            // child: Text(
                            //   "By tapping 'Sign Up & Accept', you acknowledge that you have read the Privacy Policy and agree to the Terms of Services ",
                            //   style: TextStyle(color: Colors.grey),
                            // ),
                            child: Text.rich(
                              TextSpan(
                                text:
                                    'By tapping "Sign Up & Accept", you acknowledge that you have read the ',
                                style: TextStyle(fontSize: 12.0),
                                children: <InlineSpan>[
                                  TextSpan(
                                    text: 'Privacy Policy',
                                    style: TextStyle(color: blue),
                                  ),
                                  TextSpan(
                                    text: ' and agree to the ',
                                  ),
                                  TextSpan(
                                    text: 'Terms of Services',
                                    style: TextStyle(color: blue),
                                  ),
                                ],
                              ),
                            ),
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
                      content: "Sign Up & Accept",
                      txtColor: white,
                      width: 200),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
