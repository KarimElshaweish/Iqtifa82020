import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../main.dart';
import 'home_screen_page.dart';

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
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => Setting()));
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