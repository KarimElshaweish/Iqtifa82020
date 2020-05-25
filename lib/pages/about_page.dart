
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lqtifa/Utilites/Constants.dart';

class AboutInfromation extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _AboutInfromation();
}
class _AboutInfromation extends State<AboutInfromation>{

  @override
  void initState() {
    super.initState();
  }
  void onchoiceLangClicked(){
    print("language");
  }
  setLanguage(BuildContext context)async {
//    SharedPreferences prefs = await SharedPreferences.getInstance();
//    var lang_id=languages.indexOf(_selectedLang)+1;
//    var uid = prefs.get("SessionID");
//    print(uid);
//    var response = await http.get(
//        "https://rightclick.sa/projects/saud/api/rest/languages/${lang_id}",
//        headers: {'X-Oc-Merchant-Id': 'SRQ7pJJG1VBXpQY5RPpUIigh3BdCl4He',
//          'X-Oc-Session': uid,
//        }
//    );
//    print(response.body);
  }



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: <Widget>[

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
                            Center(
                              child: Text(
                                'About',
                                style: TextStyle(
                                    color: Color(0xff828282),
                                    fontSize: 20,
                                    fontStyle: FontStyle.normal
                                ),
                              ),
                            ),
                            Container(
                              child: Align(
                                  alignment: Alignment.topRight,
                                  child: Image(
                                    image: AssetImage('assets/menu.png'),
                                  )
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 10,),
                      Padding(
                        padding: EdgeInsets.only(left: 0,right:0,top: 0),
                        child:new Container(
                          height: 100,
                          width: 150,
                          decoration: new BoxDecoration(
                            image: new DecorationImage(image:
                            new AssetImage("assets/login_black_logo.png"),
                                fit: BoxFit.fill
                            ),
                          ),
                          child:
                          Image(
                            image: AssetImage('assets/login_green_logo.png'),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          children: <Widget>[
                            Text(
                              'AQTFA Application',
                              style: TextStyle(
                                  color: Color(0xff16AE2E),
                                  fontSize: 20,
                                  fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                            SizedBox(height: 10,),
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: Text(
                                'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita',
                                style: TextStyle(
                                  color: Color(0xff828282),
                                  fontSize: 15,
                                  fontStyle: FontStyle.normal,
                                ),
                              ),
                            )
                            ,
                            //   _buildEmailTF(),
                          ],
                        ),
                      )

                      //   _buildPasswordTF("Password"),
//                      SizedBox(
//                        height: 30.0,
//                      ),
                      //  _buildPasswordTF("Confirm Password"),
                      // _buildLoginBtn()
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

}