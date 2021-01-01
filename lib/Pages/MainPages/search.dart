import 'package:flutter/material.dart';
import 'package:snapper/Pallete.dart';

class Search extends StatelessWidget {
  const Search({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.transparent.withOpacity(0.05),
                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      ),
                      // height: 40.0,
                      child: TextField(
                        textAlign: TextAlign.start,
                        decoration: InputDecoration(
                            hintText: "Search",
                            hintStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: loadingColor),
                            focusColor: Colors.black,
                            prefixIcon: Icon(
                              Icons.search_sharp,
                              color: black,
                            ),
                            border: InputBorder.none),
                      ),
                    ),
                  ),
                  FlatButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text(
                      "Cancel",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16.0),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
