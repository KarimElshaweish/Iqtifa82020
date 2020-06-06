
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:lqtifa/Model/places.dart';
import 'package:lqtifa/Model/user_location.dart';
import 'package:lqtifa/Services/live_location.dart';
import 'package:lqtifa/Utilites/Constants.dart';
import 'package:lqtifa/Widget/drawer.dart';
import 'package:lqtifa/pages/home_page.dart';
import 'package:provider/provider.dart';


class DetialsPage extends DrawerContent{
  @override
  State<StatefulWidget> createState() =>_DetialsPage();

}
class Choice{
  final String title;
  const Choice({this.title});
}
const List<Choice> chioces=<Choice>[
  Choice(title: "Deliverd"),
  Choice(title: "Active"),
];
class _DetialsPage extends State<DetialsPage> {

  void getName(double lit,double long) async{
    try {
      if(lit!=null) {

        final coordinates = new Coordinates(long, lit);
        var addresses = await Geocoder.local.findAddressesFromCoordinates(
            coordinates);
        print("heeeeeer $addresses");
        var first = addresses.first;
        print("plcase ${first.featureName} : ${first.addressLine}");
      }
    }catch(e){
      print("ex:$e");
    }
  }
   var DBRef=FirebaseDatabase.instance.reference();
   var now=DateTime.now();
  String uid;
   void setData(double long,double lit)async{
     try{
       FirebaseUser user=await FirebaseAuth.instance.currentUser();
       uid=user.uid;
       String dayName=DateFormat('EEEE').format(now);
     //  String date='${now.day}${now.month}${now.year}';
       // ignore: unrelated_type_equality_checks
       print("Aaaaaaaaaaaaaaaaaaaaaa:$Utils.currentDay");
       if(Utils.currentDay=="${now.day}${now.month}${now.year}") {
         DBRef.child(
             "data/${uid}/${Utils.currentDay}/${long.toString().replaceAll(
                 ".", "")}${lit.toString().toString().replaceAll(".", "")}")
             .set({
           'long': long.toString(),
           'lit': lit.toString(),
           'date': '${dayName} ${now.day}/${now.month}/${now.year}',
           'time': '${DateFormat('kk:mm').format(now)}'
         });
       }
     }catch(e){
      print('e');
     }
   }
   int visitePlaces=0;
  @override
  Widget build(BuildContext context){
     try {
       var userLocation = Provider.of<UserLocation>(context);
       print("lat:${userLocation.latitude},long:${userLocation.longitude}");
       print(now.toString());
       setData(userLocation.longitude, userLocation.latitude);
     }catch(e){
       print(e);
     }
     // getName(userLocation.latitude, userLocation.longitude);
    return
      Scaffold(
      body: Container(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top:20,left: 30),
                child:
                Padding(
                  padding: EdgeInsets.only(left: 10,right: 10),
                  child: SizedBox(
                    height: 100,
                    child:
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              Utils.dayName,
                              style: TextStyle(
                                  color: Color(0xff0DB14B),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                  fontStyle: FontStyle.normal
                              ),
                            ),
                            Text(
                              '${Utils.dayDate}.',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13,
                                  fontStyle: FontStyle.normal
                              ),
                            ),
                            Text(
                              '${visitePlaces} places visted.',
                              style: TextStyle(
                                  color: Color(0xffB2B2B2),
                                  fontSize: 13,
                                  fontStyle: FontStyle.normal
                              ),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: ()=>Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) =>
                                  MainHome())),
                          child: Image(
                            image: AssetImage('assets/back_home.png'),
                          ),
                        )

                      ],
                    ),
                  ),
                )

              )
              ,
              Container(
                height: double.infinity,
                padding: EdgeInsets.only(top: 80),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 640,
                        width: 600,
                        child: getTabs(),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ) ;
  }
  double long=0.0;
  double lit=0.0;
  GoogleMapController _mapController;
  void onMapCreated(controller){
    _mapController=controller;
  }
  String counter="0";
  Widget getTabs(){
    getDataMap();
    return
      DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar:new PreferredSize(preferredSize: Size.fromHeight(kToolbarHeight),
              child: Container(
                child: SafeArea(
                  child: Column(
                    children: <Widget>[

                      new Expanded(child: new Container()),
                      PreferredSize(
                          preferredSize: Size.fromHeight(10),
                          child: Align(
                            alignment: Alignment.center,
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  border: Border.all(
                                      color: Color(0xffA1A1A1),width: 1
                                  )
                              ),
                              width: 100,
                              child:Padding(
                                padding: EdgeInsets.all(2),
                                child: TabBar(
                                    unselectedLabelColor: Color(0xffA1A1A1),
                                    indicatorSize: TabBarIndicatorSize.tab,
                                    indicator: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      color: Color(0xff0DB14B),),
                                    tabs: [
                                      Tab(
                                        icon: Icon(Icons.person_pin_circle,),
                                      ),
                                      Tab(
                                        icon: Icon(Icons.dehaze),
                                      ),
                                    ]),
                              ),

                            ),
                          )),
                    ],
                  ),
                ),
              ),),
            body: TabBarView(
                physics: NeverScrollableScrollPhysics(),
                children: [
              Center(
                child: Container(
                  color: Colors.white,
                  child: GoogleMap(
                    markers: Set.from(markers),
                    onMapCreated: onMapCreated ,
                    initialCameraPosition: CameraPosition(
                        target: LatLng(long,lit),
                        zoom: 10.0
                    ),
                  ),
                ),
              ),
              Center(
                child: Container(
                  color: Colors.white,
                  child: FutureBuilder(
                    future: getData(),
                    builder: (BuildContext context,AsyncSnapshot snapshot){
                      if(places==0) {
                        Container(
                          child: Text("no data"),
                        );
                    }else{
                        if(snapshot.data!=null) {
                          this.counter = snapshot.data.length.toString();
                        }
                        return Column(
                          children: <Widget>[
                            SizedBox(
                              height: 500,
                              child: new ListView.builder(
                                itemBuilder: (BuildContext context,int index){
                                  return Container(
                                    width: 300,
                                    child: Row(
                                      children: <Widget>[
                                        Container(
                                          margin: EdgeInsets.all(6),
                                          height: 50,
                                          child: Image(
                                            image: AssetImage('assets/pin.png'),
                                          ),
                                        ),
                                        Column(
                                          children: <Widget>[
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: <Widget>[
                                                new Divider(
                                                  color: Colors.red,
                                                ),
                                                SizedBox(
                                                  child: Text(
                                                    places.toList()[index].placeName,
                                                    style: TextStyle(fontWeight: FontWeight.bold,
                                                        fontSize: 15),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                  width: 250,),
//                                                SizedBox(
//                                                  child: Text(
//                                                    "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod",
//                                                    style: TextStyle(fontWeight: FontWeight.bold,
//                                                        fontSize: 15,color: Color(0xffB2B2B2)),
//                                                    textAlign: TextAlign.center,
//                                                  ),
//                                                  width: 250,),
                                                SizedBox(
                                                  height: 3,
                                                ),
                                                SizedBox(
                                                  width: 250,
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      border: Border(
                                                        bottom: BorderSide(color: Color(0xff707070),width: 1.0),
                                                      ),
                                                    ),
                                                  ),
                                                )

                                              ],
                                            ),
                                          ],
                                        ),
                                        Text(
                                          places.toList()[index].time,style: TextStyle(
                                            color:Color(0xffB2B2B2)
                                        ),
                                        )
                                      ],
                                    ),
                                  );
                                },
                                itemCount:places==null?0:places.length,
                              ),
                            )
                          ],
                        );
                      }
                    },
                  )
                ),
              ),
            ]),
          ));
  }
  Set<Places>places=Set<Places>();
  Set<Places>placesMap=Set<Places>();
  bool inside=false;
  Future getDataMap()async{
    if(places.length==0) {
      DBRef.child("data/${uid}/${Utils.currentDay}").once().then((DataSnapshot snapshot) {
        inside=true;
        try {
          print(snapshot.value);
          Map<dynamic, dynamic> values = snapshot.value;
          values.forEach((key, value) {
            print('values:${values[key]}');
            Places place = Places(
              values[key]['lit'],
              values[key]['long'],
              values[key]['date'],
              value[key]['time']
            );
            placesMap.add(place);
          });
          setState(() {
            for(Places place in placesMap) {
              Places p = place;
              lit = double.parse(p.long);
              long = double.parse(p.lit);
              _mapController.moveCamera(CameraUpdate.newLatLng(new LatLng(long, lit)));

            }
          });

          // for (String dt in snapshot.value) {
          //print('Valuse :${dt}');

//          print(dt.value['lit']);

          //  }
        }catch(e){
          print(e);
        }
      });
    }
  }
  Future <List<Places>>getData()async{
    print("getdata func");
    if(places.length==0) {
      DBRef.child("data/${uid}/${Utils.currentDay}").once().then((DataSnapshot snapshot) {
        inside=true;
        try {
          print(snapshot.value);
          Map<dynamic, dynamic> values = snapshot.value;
          values.forEach((key, value) {
            print('values:${values[key]}');
                      Places place = Places(
            values[key]['lit'],
            values[key]['long'],
            values[key]['date'],
            values[key]['time'],
          );
           places.add(place);
          });
          setState(() {
            Places p=places.toList()[0];
            lit=double.parse(p.long);
            long=double.parse(p.lit);
          });
         // for (String dt in snapshot.value) {
            //print('Valuse :${dt}');

//          print(dt.value['lit']);

        //  }
        }catch(e){
          print(e);
        }
      });
    }
    print('count ${places.length}');
    for(Places p in places){
      final coordinates = new Coordinates(double.parse(p.lit), double.parse(p.long));
      var addresses = await Geocoder.local.findAddressesFromCoordinates(coordinates);
      var first = addresses.first;
      p.placeName=first.addressLine;
      print("${first.featureName} : ${first.addressLine}");
    }
    _add();
    setState(() {
      this.visitePlaces=places.length;
    });
    print('Count:${places.length}');
    return places.toList();
  }
  List<Marker>markers=[];
  void _add() {
  try{
    // creating a new MARKER
    final Marker marker = Marker(
      markerId: MarkerId(places.toList()[0].placeName),
      position: LatLng(
          double.parse(places.toList()[0].lit),
          double.parse(places.toList()[0].long)
      ),
      onTap: () {
        print('taped');
      },
    );
    setState(() {
      print("a7a");
      markers.add(marker);
    });
  }catch(e){
    print(e);
  }

  }
}