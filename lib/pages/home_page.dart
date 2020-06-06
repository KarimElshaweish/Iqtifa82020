
import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:lqtifa/Utilites/Constants.dart';
import 'package:lqtifa/pages/home_screen_page.dart';
import 'package:lqtifa/pages/locaion_live.dart';

class MainHome extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _MainHome();
}
class _MainHome extends State<MainHome>{
  @override
  void initState() {
    super.initState();
  }
  bool checkData(String date){
    DateTime now = new DateTime.now();
 //   String nSt="${now.day}/${now.month}/${now.year}";
    List<String> dateList=date.split(" ");
    if(dateList!=[]) {
      print("data:${dateList}");
      String cd = dateList.length>1?dateList[1]:dateList[0];
      List<String> dataSpliter = cd.split("/");
      if (double.parse(now.year.toString()) < double.parse(dataSpliter[2])) {
        print("year: ${now.year}  < ${dataSpliter[2]}");
        return false;
      } else
      if (double.parse(now.month.toString()) < double.parse(dataSpliter[1])) {
        print("month: ${now.month}  < ${dataSpliter[1]}");
        return false;
      }
      else if (double.parse(now.day.toString()) < double.parse(dataSpliter[0])) {
        print("day: ${now.day}  < ${dataSpliter[0]}");
        return false;
      }
      return true;
    }
    return false;
  }
  final emailTextFiled=new TextEditingController();
  List<dynamic>days=[];
  List<dynamic>daysNames=[];
  Future<dynamic> getdata() async {
  try {
    var DBRef = FirebaseDatabase.instance.reference();
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    String uid = user.uid;
    DBRef.child("datas/${uid}").once().then((datasnapshot) {
      List<dynamic>filterdDays=[];
      filterdDays = datasnapshot.value['days'];
      filterdDays=filterdDays.reversed.toList();
      for(int i=0;i<filterdDays.length;i++)
        if(!checkData(filterdDays[i])) {
          filterdDays.remove(filterdDays[i]);
          i--;
          print("current list: $filterdDays");
        }
      days=filterdDays;
    });
  }catch(e){
    print(e);
  }
    return days;
  }

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        alignment: Alignment.bottomCenter,
                        image: AssetImage('assets/home_btt.png')
                    )
                ),
              ),
              Container(
                height: double.infinity,
                alignment: Alignment.topCenter,
                width: double.infinity,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    vertical: 20.0,
                  ),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Stack(
                          children: <Widget>[
                            Align(
                                alignment: Alignment.topLeft,
                                child: Column(
                                  children: <Widget>[
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child:Text(
                                        'Home',
                                        style: TextStyle(
                                          color: Color(0xff0DB14B),
                                          fontSize: 23,
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ) ,
                                    ),
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child:
                                      Text(
                                        'Your last 14 visted places',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                          fontStyle: FontStyle.normal,
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        'click to view details',
                                        style: TextStyle(
                                          color: Color(0xffCCCCCC),
                                          fontSize: 15,
                                          fontStyle: FontStyle.normal,
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                            ),
                            Container(
                              child: GestureDetector(
                                onTap:()=> Navigator.of(context).push(
                                    MaterialPageRoute(builder: (context) =>
                                        Setting())),
                                child: Align(
                                    alignment: Alignment.topRight,
                                    child: Image(
                                      image: AssetImage('assets/menu.png'),
                                    )
                                ),
                              )

                            )
                          ],
                        ),
                      ),
                      SizedBox(
                          height: 500,
                          child: FutureBuilder(
                            future: getdata(),
                            builder: (BuildContext context,AsyncSnapshot snapshot){
                              return
                                GridView.count(crossAxisCount: 3,
                            children: new List<Widget>.generate(days.length, (index) {
                              return new GridTile(
                                child:
                                GestureDetector(
                                  onTap:() {
                                    Utils.currentDay=days[index].toString().split(" ")[1].replaceAll("/","");
                                    print('utils:${Utils.currentDay}');
                                    Utils.dayName=days[index].toString().split(" ")[0];
                                    Utils.dayDate=days[index].toString().split(" ")[1];
                                    Navigator.of(context).push(
                                        MaterialPageRoute(builder: (context) =>
                                            LiveLocation()));
                                  },
                                  child: new Container(
                                      margin: EdgeInsets.all(7),
                                      decoration: BoxDecoration(
                                          color: Color(0xffF5F6FA),
                                          borderRadius: BorderRadius.all(Radius.circular(20))
                                      ),
                                      child:
                                      Padding(
                                        padding: EdgeInsets.all(10),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: <Widget>[
                                            Text(
                                              'Day ${index+1}',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15,
                                                fontStyle: FontStyle.normal,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Center(
                                              child:  Text(
                                                '${days[index]}  Places Visted',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: Color(0xff707070),
                                                  fontSize: 12,
                                                  fontStyle: FontStyle.normal,
                                                ),
                                              ) ,

                                            )
                                          ],
                                        ),
                                      )

                                  ),
                                )
                              );
                            }));
                            },
                          )
                      )
                    ],
                  ),
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }

}