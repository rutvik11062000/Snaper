import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:snapper/Pallete.dart';
import 'package:snapper/UI/shared/AppBarConstWidget.dart';
import 'package:snapper/UI/shared/CustomCircleAvatarOpacity.dart';

class Map extends StatefulWidget {
  const Map({Key key}) : super(key: key);

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  @override
  _MapState createState() => _MapState();
}

class _MapState extends State<Map> {
  Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            zoomControlsEnabled: false,
            mapType: MapType.normal,
            initialCameraPosition: Map._kGooglePlex,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
          ),
          SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: AppBarConstWidget(
                    specificColor: Colors.blueGrey,
                  ),
                ),
                Text(
                  "Map",
                  style: titleHeading,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0, left: 20.0),
                  child: BuildOpacityButton(
                    iconData: FontAwesomeIcons.cog,
                    color: Colors.blueGrey,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
