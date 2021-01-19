import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:snapper/Pallete.dart';
import 'package:snapper/UI/shared/CustomCircleAvatarOpacity.dart';
import 'package:snapper/services/chatServices.dart';

class ChatScreen extends StatelessWidget {
  final String chat_room_key;
  const ChatScreen({Key key, this.chat_room_key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _controller = TextEditingController();
    ScrollController _scrollController = new ScrollController();
    return Scaffold(
      appBar: AppBar(
        elevation: 1.0,
        leading: Container(
          height: 18.0,
          child: Center(
            child: BuildOpacityButton(iconData: FontAwesomeIcons.userAlt),
          ),
        ),
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Text(
          "Person Name",
          style: titleHeading,
        ),
        actions: [
          Container(
            width: 90.0,
            child: Row(
              children: [
                Container(
                  height: 25.0,
                  width: 35.0,
                  decoration: BoxDecoration(
                    color: Colors.transparent.withOpacity(.12),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20.0),
                      topLeft: Radius.circular(20.0),
                    ),
                  ),
                  child: Icon(
                    FontAwesomeIcons.phone,
                    size: 14.0,
                  ),
                ),
                hspace5,
                Container(
                  height: 25.0,
                  width: 35.0,
                  decoration: BoxDecoration(
                    color: Colors.transparent.withOpacity(.12),
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                    ),
                  ),
                  child: Icon(
                    FontAwesomeIcons.video,
                    size: 14.0,
                  ),
                )
              ],
            ),
          ),
          IconButton(
            icon: Icon(FontAwesomeIcons.arrowRight),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: StreamBuilder(
        stream: chatroomsnapshot(chat_room_key).snapshots(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) return Text("");
          return Column(
            children: [
              Expanded(
                // height: MediaQuery.of(context).size.height * 0.5,
                // color: Colors.red,
                child: NotificationListener<OverscrollIndicatorNotification>(
                  onNotification: (overscroll) {
                    overscroll.disallowGlow();
                  },
                  child: ListView(
                    controller: _scrollController,
                    reverse: true,
                    // shrinkWrap: true,
                    children: snapshot.data.docs.map<Widget>(
                      (doc) {
                        return Container(
                          padding:
                              EdgeInsets.only(left: 8.0, right: 8.0, top: 5.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              doc['sender_ID'].toString() != 'USER1'
                                  ? Text(
                                      "OTHER",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w800,
                                          color: Colors.red,
                                          fontSize: 10.0),
                                    )
                                  : Text(
                                      "ME",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w800,
                                          color: Colors.blue,
                                          fontSize: 10.0),
                                    ),
                              Row(
                                children: [
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () async {
                                        await updateSaveProperty(doc);
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: doc['save'] == true
                                              ? Colors.transparent
                                                  .withOpacity(0.12)
                                              : Colors.white,
                                          border: Border(
                                            left: BorderSide(
                                              color:
                                                  doc['sender_ID'].toString() !=
                                                          'USER1'
                                                      ? Colors.red
                                                      : Colors.blue,
                                              width: doc['save'] == true
                                                  ? 3.0
                                                  : 1.0,
                                            ),
                                          ),
                                        ),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 8.0, vertical: 2.0),
                                        child: Text(
                                          doc['texts'].toString(),
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    ).toList(),
                  ),
                ),
              ),
              Container(
                height: 100.0,
                child: Text(""),
              )
            ],
          );
        },
      ),
      bottomSheet: Container(
        height: 60.0,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.blueGrey[100]),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            BuildOpacityButton(
              iconData: FontAwesomeIcons.camera,
              color: Colors.blueGrey,
              size: 22.0,
            ),
            Container(
              width: 200,
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
                  addMessage('USER1', _controller.text);
                  // controller.clear();
                  _controller.text = "";
                },
                textAlign: TextAlign.start,
                decoration: InputDecoration(
                  hintText: "Send a chat",
                  contentPadding: EdgeInsets.all(15.0),
                  hintStyle: TextStyle(
                      fontWeight: FontWeight.bold, color: loadingColor),
                  focusColor: Colors.black,
                  border: InputBorder.none,
                ),
                keyboardType: TextInputType.text,
              ),
            ),
            Icon(
              FontAwesomeIcons.smileWink,
              size: 20.0,
              color: Colors.blueGrey,
            ),
            Icon(
              FontAwesomeIcons.memory,
              size: 20.0,
              color: Colors.blueGrey,
            ),
            Icon(
              FontAwesomeIcons.rocket,
              size: 20.0,
              color: Colors.blueGrey,
            ),
          ],
        ),
      ),
    );
  }
}
