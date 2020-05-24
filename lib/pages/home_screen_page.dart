
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
                          child: Image(
                            image: AssetImage('assets/arrow.png'),
                          ),
                        )
                      ],
                    )
                  ],
                ),


              ],
            ),
            onPressed: (){
              switch(name){
                case "Login / Sign up":
               //   Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignUpScreen()));
                  break;
                case "Contact Us":
                  break;
                case "Language":
                //  Navigator.of(context).push(MaterialPageRoute(builder: (context) => ChoiceLanguage()));
                  break;
                case "About Us":
                  break;
                case "Terms and Conditions":
                  break;
              }
            },

          )

      )
    ],
  );
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
              //logout(context);
            },

          )

      )
    ],
  );
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
                          Divider(),
                          _CustomeButton(context,"| About",'assets/info.png'),
                          Divider(),
                          _CustomeButton(context,"| Help",'assets/help.png'),
                          Divider(),
                          _CustomeButton(context,"| Terms and Conditions",'assets/terms.png'),
                          Divider(),
                        ],
                      ),
                    )
                  ],
                ),
                _CustomeLogout(context)
              ],
            )
          ],
        )

    );
  }

}