import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:snapper/Pallete.dart';
import 'MainPages/exportPageBundle.dart';

class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _page = 0;
  PageController _c;
  // C
  List<CameraDescription> cameras;
  CameraDescription firstCamera;
  CameraController _controller;
  Future<void> _initializeControllerFuture;

  @override
  void initState() {
    _c = new PageController(
      initialPage: _page,
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: new BottomNavigationBar(
        selectedIconTheme: IconThemeData(color: _getColor()),
        unselectedIconTheme: IconThemeData(color: Colors.white60),
        backgroundColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: _page,
        onTap: (index) {
          this._c.animateToPage(index,
              duration: const Duration(milliseconds: 100),
              curve: Curves.linear);
        },
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.location_pin),
            label: 'location',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline),
            label: 'chats',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.camera_alt_outlined,
            ),
            label: 'camera',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people_alt_outlined),
            label: 'stories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.play_arrow_outlined),
            label: 'discovery',
          ),
        ],
      ),
      body: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CircleAvatar(
                // backgroundColor: Colors.red,
                child: Icon(Icons.person),
              ),
              CircleAvatar(
                // backgroundColor: Colors.red,
                child: Icon(Icons.search),
              ),
            ],
          ),
          PageView(
            controller: _c,
            onPageChanged: (newPage) {
              setState(() {
                this._page = newPage;
              });
            },
            children: <Widget>[
              Map(),
              Chats(),
              Camera(),
              Stories(),
              Discovery(),
            ],
          ),
        ],
      ),
    );
  }

  Color _getColor() {
    switch (this._page) {
      case 0:
        return Colors.green;
        break;
      case 1:
        return Colors.blue;
        break;
      case 2:
        return yellow;
        break;
      case 3:
        return Colors.purple;
        break;
      case 4:
        return Colors.red;
        break;
      default:
    }
  }
}
