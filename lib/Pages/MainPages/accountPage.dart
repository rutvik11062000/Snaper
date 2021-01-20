import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:snapper/Pallete.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: white,
            automaticallyImplyLeading: false,
            leading: IconButton(
              icon: Icon(FontAwesomeIcons.arrowDown),
              onPressed: () => Navigator.pop(context),
            ),
            actions: [
              IconButton(
                icon: Icon(FontAwesomeIcons.cog),
                onPressed: () {},
              )
            ],
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.only(top: 15.0),
              height: 230,
              // color: Colors.red,
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: yellow,
                    ),
                    height: 120,
                    width: 120,
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 30.0),
                    child: Text(
                      "Rutvik",
                      style: titleHeading,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(" rutvik_308 "),
                      Icon(
                        Icons.circle,
                        size: 4,
                      ),
                      Text(" 35,678 "),
                      Icon(
                        Icons.circle,
                        size: 4,
                      ),
                      hspace5,
                      Container(
                        height: 25.0,
                        width: 50.0,
                        decoration: BoxDecoration(
                          color: Colors.purple,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        child: Icon(
                          FontAwesomeIcons.diceTwo,
                          size: 15,
                          color: white,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: buildSection(
                'Stories',
                "Add to my story",
                "Add to our story",
                FontAwesomeIcons.camera,
                FontAwesomeIcons.camera,
                Icons.menu),
          ),
          SliverToBoxAdapter(
            child: buildSection("Friends", "Add Friends", "My Friends",
                Icons.person_add, Icons.contact_phone, Icons.arrow_right_alt),
          ),
        ],
      ),
    );
  }

  Padding buildSection(String title, String list1, String list2, IconData icon1,
      IconData icon2, IconData icont) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16.0),
          ),
          Card(
            child: ListTile(
              title: Text(list1),
              leading: Icon(icon1),
              onTap: () {},
              trailing: Icon(icont),
            ),
          ),
          Card(
            child: ListTile(
              title: Text(list2),
              leading: Icon(icon2),
              onTap: () {},
              trailing: Icon(icont),
            ),
          ),
        ],
      ),
    );
  }
}
