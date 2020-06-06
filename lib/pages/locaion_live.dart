import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lqtifa/Model/user_location.dart';
import 'package:lqtifa/Services/live_location.dart';
import 'package:lqtifa/pages/detials_page.dart';
import 'package:provider/provider.dart';

class LiveLocation extends StatelessWidget{
  _liveLocation(){
    try{
     return LocationServices().locationSteam;
    }catch(e){
      print(e);
    }
  }
  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserLocation>(
      create: (context) => _liveLocation(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
          home: Scaffold(
            body: DetialsPage(),
          )),
    );
  }

}