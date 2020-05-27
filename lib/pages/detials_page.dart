import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lqtifa/Widget/drawer.dart';
import 'package:lqtifa/pages/information_list_page.dart';
import 'package:lqtifa/pages/map_page.dart';


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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top:10,left: 30),
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
                              'Saturday',
                              style: TextStyle(
                                  color: Color(0xff0DB14B),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                  fontStyle: FontStyle.normal
                              ),
                            ),
                            Text(
                              '14 MAY 2020.',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13,
                                  fontStyle: FontStyle.normal
                              ),
                            ),
                            Text(
                              '8 places visted.',
                              style: TextStyle(
                                  color: Color(0xffB2B2B2),
                                  fontSize: 13,
                                  fontStyle: FontStyle.normal
                              ),
                            ),
                          ],
                        ),
                        Image(
                          image: AssetImage('assets/back_home.png'),
                        ),
                      ],
                    ),
                  ),
                )

              )
              ,
              Container(
                height: double.infinity,
                padding: EdgeInsets.only(top: 70),
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
  void onMapCreated(controller){

  }
  Widget getTabs(){
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
            body: TabBarView(children: [
              Center(
                child: Container(
                  color: Colors.white,
                  child: GoogleMap(
                    onMapCreated: onMapCreated ,
                    initialCameraPosition: CameraPosition(
                        target: LatLng(50.0,50.0),
                        zoom: 10.0
                    ),
                  ),
                ),
              ),
              Center(
                child: Container(
                  color: Colors.white,
                  child:new ListView.builder(
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
                                        "King Faisal Specialist Hospital & Research Centre",
                                        style: TextStyle(fontWeight: FontWeight.bold,
                                            fontSize: 15),
                                        textAlign: TextAlign.center,
                                      ),
                                      width: 250,),
                                    SizedBox(
                                      child: Text(
                                        "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod",
                                        style: TextStyle(fontWeight: FontWeight.bold,
                                            fontSize: 15,color: Color(0xffB2B2B2)),
                                        textAlign: TextAlign.center,
                                      ),
                                      width: 250,),
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
                            "10 : 20 PM",style: TextStyle(
                            color:Color(0xffB2B2B2)
                          ),
                          )
                          ],
                        ),
                      );
                    },
                    itemCount: 5,
                  ),
                ),
              ),
            ]),
          ));
  }
}