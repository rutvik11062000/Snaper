import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:snapper/Pallete.dart';

class ToSendList extends StatefulWidget {
  const ToSendList({Key key}) : super(key: key);

  @override
  _ToSendListState createState() => _ToSendListState();
}

class _ToSendListState extends State<ToSendList> {
  Map<int, String> mp = new Map<int, String>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Container(
        height: 60.0,
        color: Colors.blue,
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 8,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: mp.keys.map<Widget>((key) => Text(mp[key])).toList(),
              ),
            ),
            Expanded(
              flex: 2,
              child: CircleAvatar(
                  backgroundColor: white,
                  radius: 20.0,
                  child: Icon(
                    Icons.send,
                    color: blue,
                  )),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.grey[900],
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: CustomScrollView(
          slivers: <Widget>[
            CustomAppBar(),
            StoriesSection(),
            SliverPadding(
              padding: EdgeInsets.only(top: 15.0),
              sliver: SliverToBoxAdapter(
                child: Text(
                  'Recents',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                      color: white),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                String name = 'title' + index.toString();
                return CardWidget(
                  first: index == 0 ? true : false,
                  title: name,
                  selected: mp.containsKey(index),
                  function: () {
                    print("pressed");
                    if (mp.containsKey(index)) {
                      mp.remove(index);
                    } else {
                      mp[index] = name;
                    }
                    setState(() {});
                  },
                );
              }, childCount: 15),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      leadingWidth: 15.0,
      pinned: true,
      title: Container(
        width: 350,
        child: TextField(
          onEditingComplete: () {},
          // controller: _controller,
          textInputAction: TextInputAction.send,
          onSubmitted: (msg) {},
          textAlign: TextAlign.start,
          decoration: InputDecoration(
            prefixIcon: Icon(
              FontAwesomeIcons.search,
              color: Colors.white,
            ),
            hintText: "Send To ...",
            contentPadding: EdgeInsets.all(15.0),
            hintStyle: TextStyle(
                fontWeight: FontWeight.bold,
                color: loadingColor,
                fontSize: 18.0),
            focusColor: Colors.white,
            border: InputBorder.none,
          ),
        ),
      ),
      backgroundColor: Colors.transparent,
      automaticallyImplyLeading: false,
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: Icon(
          Icons.arrow_back_ios,
          color: white,
        ),
      ),
    );
  }
}

class StoriesSection extends StatelessWidget {
  const StoriesSection({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Stories",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 16.0),
          ),
          CardWidget(
            title: 'My Story',
            first: false,
            selected: false,
          ),
          CardWidget(
            title: 'Our Story',
            first: false,
            selected: false,
          )
        ],
      ),
    );
  }
}

class CardWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool first;
  final bool selected;
  final Function function;
  const CardWidget({
    Key key,
    this.title,
    this.subtitle,
    this.first,
    this.selected,
    this.function,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: white,
          borderRadius:
              BorderRadius.vertical(top: Radius.circular(first ? 5.0 : 0.0))),
      child: ListTile(
        onTap: function,
        // subtitle: Text(subtitle ?? ""),
        title: Text(
          title,
          style: TextStyle(
              fontWeight: selected ? FontWeight.bold : FontWeight.w600,
              color: selected ? Colors.blue : black),
        ),
        leading: CircleAvatar(),
      ),
    );
  }
}
