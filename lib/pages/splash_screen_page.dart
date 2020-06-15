import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lqtifa/pages/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'home_page.dart';

class SplashScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState()=> new _SplashScreen();
}
class _SplashScreen extends State<SplashScreen>{
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 5),onDoneLoading);

  }
  onDoneLoading() async {
    FirebaseUser user=await FirebaseAuth.instance.currentUser();
    if(user==null) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
            (Route<dynamic> route) => false,
      );
    }else{
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => MainHome()),
            (Route<dynamic> route) => false,
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body:
      Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/background.png'),
                    fit: BoxFit.cover
                )
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image(
                        image: AssetImage('assets/logo.png'),
                      ),
                      Padding(padding: EdgeInsets.only(top: 10.0),
                      ),
                    ],
                  ),
                ),
              ),Expanded(
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Opacity(
                        opacity: .2,
                        child: Image(
                          image: AssetImage('assets/logo.png'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

}