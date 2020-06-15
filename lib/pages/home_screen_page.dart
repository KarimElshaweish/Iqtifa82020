
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lqtifa/Services/Auth.dart';
import 'package:lqtifa/pages/about_page.dart';
import 'package:lqtifa/pages/edit_profile_information_page.dart';
import 'package:lqtifa/pages/home_page.dart';
import 'package:lqtifa/pages/locaion_live.dart';
import 'package:lqtifa/pages/login_page.dart';
import 'package:url_launcher/url_launcher.dart';

class Setting extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _Setting();

}
Widget _CustomeButton(BuildContext context,String name,String img){
  return Column(
    children: <Widget>[
      Container(
          padding: EdgeInsets.all(8),
          width: double.infinity,
          child:new FlatButton(
            child:Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                        child:  Container(
                          width: 20,
                          height: 20,
                          child: Image(
                            image: AssetImage(img),
                          ),
                        )
                    ),
                    SizedBox(width: 15,),
                    Container(
                        child:Column(
                          children: <Widget>[
                            new Text(
                              name,
                              style: TextStyle(
                                  color: Colors.black45,
                                  fontSize: 18
                              ),
                            ),
                          ],
                        )
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[

                    Row(
                      children: <Widget>[
                        Container(
                        )
                      ],
                    )
                  ],
                ),


              ],
            ),
            onPressed: (){
              switch(name){
                case "| Home":
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => MainHome()));
                  break;
                case "| Edit Profile Information":
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => EditProfileInformation()));
                  break;
                case "| About":
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => AboutInfromation()));
                  break;
                case "| Terms and Conditions":
                 openUrl();
                  break;
              }
            },

          )

      )
    ],
  );
}
openUrl()async{
  print('a7ooooooooooo');
  const url = "https://flutter.io";
  if (await canLaunch(url))
    launch(url);
}
showAlertDialog(BuildContext context) {

  // set up the button
  Widget okButton = FlatButton(
    child: Text("OK"),
    onPressed:  () => Navigator.of(context).pop(true),
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Logout Failed"),
    content: Text("check network Connection."),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

Widget _CustomeLogout(BuildContext context){
  return Column(
    children: <Widget>[
      Container(
          padding: EdgeInsets.all(8),
          width: double.infinity,
          child:new FlatButton(
            child:Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                        child:  Container(
                          width: 20,
                          height: 20,
                          child: Image(
                            image: AssetImage('assets/logout.png'),
                          ),
                        )
                    ),
                    SizedBox(width: 15,),
                    Container(
                        child:Column(
                          children: <Widget>[
                            new Text(
                              "| Sign Out ",
                              style: TextStyle(
                                  color: Color(0xffDC3D3D),
                                  fontSize: 18
                              ),
                            ),
                          ],
                        )
                    ),
                  ],
                ),


              ],
            ),
            onPressed: (){
              logout(context);
            },

          )

      )
    ],
  );
}

void logout(BuildContext context)async {
  Auth auth=new Auth();
  var result=await auth.signOut();
  if(result==null)
    showAlertDialog(context);
  else
     Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginScreen()));
  }
class _Setting extends State<Setting>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
        ListView(
          padding: const EdgeInsets.only(bottom: 15),
          children: <Widget>[
            Column(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.topCenter,
                      margin: EdgeInsets.only(top:25),

                      child: Container(
                          width: 150,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/black_logo.png'),
                              fit: BoxFit.cover
                            ),
                          ),
                          child:Image(
                            image: AssetImage('assets/green_logo.png'),
                          )),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: <Widget>[
                          _CustomeButton(context,"| Home",'assets/home.png'),
                          Divider(),
                          _CustomeButton(context,"| Edit Profile Information",'assets/avatar.png'),
//                          Divider(),
//                          _CustomeButton(context,"| About",'assets/info.png'),
//                          Divider(),
//                          _CustomeButton(context,"| Help",'assets/help.png'),
                          Divider(),
                          _CustomeButton(context,"| Terms and Conditions",'assets/terms.png'),
                          Divider(),
//                          _CustomeButton(context,"| Developed by Right Click",'assets/right_click.png'),
//                          Divider(),
                        ],
                      ),
                    )
                  ],
                ),
                _CustomeLogout(context),
                GestureDetector(
                  onTap: _launchURL,
                  child: Image(
                    height: 100,
                    width: 100,
                    image: AssetImage('assets/right_click.png'),
                  ),
                )
              ],
            )
          ],
        )

    );
  }
  _launchURL() async {
    const url = 'https://rightclick.sa/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}