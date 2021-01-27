import 'package:flutter/material.dart';
import 'package:snapper/Pages/AddPage/addPage.dart';
import 'package:snapper/UI/shared/AppBarConstWidget.dart';
import 'package:snapper/UI/shared/CustomCircleAvatarOpacity.dart';

import '../../Pallete.dart';

class Stories extends StatelessWidget {
  const Stories({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
          leadingWidth: 150.0,
          leading: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: AppBarConstWidget(
              specificColor: white,
            ),
          ),
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            "Stories",
            style: TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          elevation: 0.0,
          actions: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: _TrailingAppBarChat(),
            ),
          ]),
      body: ListView(
        children: [
          FriendsSection(),
          SubscriptionSection(),
          ForYouTtile(),
          Expanded(child: ForYou()),
        ],
      ),
    );
  }
}

class ForYouTtile extends StatelessWidget {
  const ForYouTtile({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: Text(
        "For You",
        style: normalHeading,
      ),
    );
  }
}

class FriendsSection extends StatelessWidget {
  const FriendsSection({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.0,
      // color: Colors.red,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: FriendSectionHeading(),
          ),
          // FriendStory(),
          Container(
            height: 100,
            padding: EdgeInsets.only(left: 8.0),
            child: ListView.separated(
              itemCount: 10,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return FriendStory();
              },
              separatorBuilder: (BuildContext context, int index) {
                return hspace5;
              },
            ),
          ),
        ],
      ),
    );
  }
}

class FriendStory extends StatelessWidget {
  const FriendStory({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.blue,
      height: 100,
      width: 80.0,
      child: Column(
        children: [
          CircleAvatar(
            radius: 38.0,
          ),
          SizedBox(
            height: 5.0,
          ),
          Text(
            'Name',
            style: subtitleHeading,
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    );
  }
}

class FriendSectionHeading extends StatelessWidget {
  const FriendSectionHeading({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Freinds", style: normalHeading),
        FlatButton.icon(
          icon: Icon(Icons.add),
          label: Text('My Story', style: normalHeading),
          onPressed: () {},
        )
      ],
    );
  }
}

class _TrailingAppBarChat extends StatelessWidget {
  const _TrailingAppBarChat({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BuildOpacityButton(
          function: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => AddPage(), fullscreenDialog: true)),
          iconData: Icons.person_add_alt_1,
          color: white,
        ),
        hspace10,
        BuildOpacityButton(
          function: () {},
          iconData: Icons.menu,
          color: white,
        ),
        hspace10,
      ],
    );
  }
}

class SubscriptionSection extends StatelessWidget {
  const SubscriptionSection({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
      // color: Colors.red,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
            child: Text(
              'Subscriptions',
              style: normalHeading,
            ),
          ),
          // SubscriptionStory(),
          Container(
            height: 170.0,
            padding: EdgeInsets.only(left: 8.0),
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                return SubscriptionStory();
              },
              separatorBuilder: (BuildContext context, int index) {
                return hspace5;
              },
            ),
          ),
        ],
      ),
    );
  }
}

class SubscriptionStory extends StatelessWidget {
  const SubscriptionStory({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170.0,
      width: 100.0,
      color: Colors.blue,
      child: Stack(
        children: [
          Positioned(
            left: 5.0,
            bottom: 20.0,
            child: Text(
              'Heading',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: white,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          )
        ],
      ),
    );
  }
}

class ForYou extends StatelessWidget {
  const ForYou({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: EdgeInsets.all(8.0),
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
      childAspectRatio: (1 / 1.5),
      crossAxisCount: 2,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: List.generate(10, (index) {
        return Container(
          color: Colors.red,
          child: Text(index.toString()),
        );
      }),
    );
  }
}
