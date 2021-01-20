import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:snapper/Pallete.dart';
import 'package:snapper/services/GLOBALSERVICES.dart';

class AddPage extends StatelessWidget {
  const AddPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _controller = TextEditingController();
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            collapsedHeight: 120,
            centerTitle: true,
            automaticallyImplyLeading: false,
            backgroundColor: white,
            leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(FontAwesomeIcons.arrowDown),
            ),
            actions: [
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(Icons.menu),
              ),
            ],
            flexibleSpace: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.only(bottom: 5.0),
                  child: Container(
                    width: 350,
                    decoration: BoxDecoration(
                      color: Colors.transparent.withOpacity(0.05),
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    ),
                    // height: 40.0,
                    child: TextField(
                      onEditingComplete: () {},
                      controller: _controller,
                      textInputAction: TextInputAction.send,
                      onSubmitted: (msg) {
                        // addMessage('USER1', _controller.text);
                        // // controller.clear();
                        // _controller.text = "";
                      },
                      textAlign: TextAlign.start,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          FontAwesomeIcons.search,
                          color: Colors.black,
                        ),
                        suffixIcon: Icon(
                          FontAwesomeIcons.snapchatSquare,
                          color: Colors.black,
                        ),
                        hintText: "Find Friends",
                        contentPadding: EdgeInsets.all(15.0),
                        hintStyle: TextStyle(
                            fontWeight: FontWeight.bold, color: loadingColor),
                        focusColor: Colors.black,
                        border: InputBorder.none,
                      ),
                      keyboardType: TextInputType.text,
                    ),
                  ),
                )),
            pinned: true,
            title: Text(
              "Add Friends",
              style: titleHeading,
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.all(10.0),
              child: Text(
                "Quick Add",
                style: TextStyle(fontWeight: FontWeight.w800),
              ),
            ),
          ),
          FutureBuilder(
            future: getAddFriendList(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (!snapshot.hasData)
                return SliverToBoxAdapter(
                  child: Text("loading"),
                );

              return SliverList(
                // Use a delegate to build items as they're scrolled on screen.
                delegate: SliverChildBuilderDelegate(
                  // The builder function returns a ListTile with a title that
                  // displays the index of the current item.
                  (context, index) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 25.0,
                      ),
                      title: Text(
                        snapshot.data['list'][index]['username'],
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16.0,
                            color: Colors.black87),
                      ),
                      subtitle: Text(snapshot.data['list'][index]['userID']),
                      trailing: Container(
                        height: 35.0,
                        width: 80.0,
                        padding: EdgeInsets.all(5.0),
                        // color: Colors.red,
                        decoration: BoxDecoration(
                          color: Colors.transparent.withOpacity(0.05),
                          borderRadius: BorderRadius.all(Radius.circular(30.0)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(
                              Icons.add,
                              size: 16.0,
                            ),
                            Text(
                              "Add",
                              style: TextStyle(
                                  fontSize: 12.0, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  // Builds 1000 ListTiles
                  childCount: snapshot.data['list'].length,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
