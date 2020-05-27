import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InformationList extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      margin:EdgeInsets.only(left: 10,right: 10),
      child: new ListView.builder(
        itemBuilder: (BuildContext context,int index){
          return Container(
            child: Row(
              children: <Widget>[

              ],
            ),
          );
        },
      ),
    );
  }

}