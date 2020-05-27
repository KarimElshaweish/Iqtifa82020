import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget{

  @override
  State<StatefulWidget> createState()=>_MapPage();
}
class _MapPage extends State<MapPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          GoogleMap(
            onMapCreated: onMapCreated ,
            initialCameraPosition: CameraPosition(
                target: LatLng(50.0,50.0),
                zoom: 10.0
            ),
          )
        ],
      ),
    );
  }
  void onMapCreated(controller){

  }
}