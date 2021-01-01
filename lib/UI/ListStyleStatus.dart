import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

ListStyleStatus newSnap = ListStyleStatus(
    squareColor: Colors.red,
    text: "New Snap",
    squareIcon: FontAwesomeIcons.squareFull,
    fontColor: Colors.red);
ListStyleStatus snapReceived = ListStyleStatus(
    squareColor: Colors.red,
    text: "Received",
    squareIcon: FontAwesomeIcons.square);
ListStyleStatus videoSnap = ListStyleStatus(
    squareColor: Colors.purple,
    text: "New Snap",
    squareIcon: FontAwesomeIcons.squareFull,
    fontColor: Colors.purple);
ListStyleStatus videoSnapReceived = ListStyleStatus(
    squareColor: Colors.purple,
    text: "Received",
    squareIcon: FontAwesomeIcons.square);
ListStyleStatus newMessage = ListStyleStatus(
    squareColor: Colors.blue,
    text: "New Message",
    squareIcon: FontAwesomeIcons.squareFull,
    fontColor: Colors.blue);
ListStyleStatus messageReceived = ListStyleStatus(
    squareColor: Colors.blue,
    text: "Received",
    squareIcon: FontAwesomeIcons.squareFull);

class ListStyleStatus {
  String text;
  Color squareColor;
  IconData squareIcon;
  Color fontColor;

  ListStyleStatus(
      {this.text, this.squareColor, this.squareIcon, this.fontColor});
}

ListStyleStatus getListStyleStatus(String status) {
  switch (status) {
    case "newSnap":
      return newSnap;
      break;
    case "snapReceived":
      return snapReceived;
      break;
    case "videoSnap":
      return videoSnap;
      break;
    case "videoSnapReceived":
      return videoSnapReceived;
      break;
    case "newMessage":
      return newMessage;
      break;
    case "messageReceived":
      return messageReceived;
      break;
    default:
  }
}
