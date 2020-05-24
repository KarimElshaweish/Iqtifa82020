
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lqtifa/Utilites/Constants.dart';


class LoginScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState()=>_LoginScreenState();
}
class _LoginScreenState extends State<LoginScreen> {
  bool _rememberMe = false;
  onSignUpClicked() async {
  //  Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignUpScreen()));
  }
  onLoginClicked() async {
    print(emailTextFiled.text.toString());
    print(passwrodTextFiled.text.toString());
    //Navigator.of(context).push(MaterialPageRoute(builder: (context) => MainPage()));
  }
  final emailTextFiled=new TextEditingController();
  final passwrodTextFiled=new TextEditingController();
  Widget _buildEmailTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Email',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyleGezara,
          height: 60.0,
          child: TextField(
            controller: emailTextFiled,
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.email,
                color: Colors.black,
              ),
              hintText: 'Enter your Email',
              hintStyle: kHintTextStyleGezara,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Password',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyleGezara,
          height: 60.0,
          child: TextField(
            controller: passwrodTextFiled,
            obscureText: true,
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.black,
              ),
              hintText: 'Enter your Password',
              hintStyle: kHintTextStyleGezara,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildForgotPasswordBtn() {
    return Container(
      alignment: Alignment.centerRight,
      child: FlatButton(
        onPressed: () => print('Forgot Password Button Pressed'),
        padding: EdgeInsets.only(right: 0.0),
        child: Text(
          'Forgot Password?',
          style: kLabelStyleGezaraForget,
        ),
      ),
    );
  }

  Widget _buildRememberMeCheckbox() {
    return Container(
      height: 20.0,
      child: Row(
        children: <Widget>[
          Theme(
            data: ThemeData(unselectedWidgetColor: Colors.white),
            child: Checkbox(
              value: _rememberMe,
              checkColor: Colors.green,
              activeColor: Colors.white,
              onChanged: (value) {
                setState(() {
                  _rememberMe = value;
                });
              },
            ),
          ),
          Text(
            'Remember me',
            style: kLabelStyle,
          ),
        ],
      ),
    );
  }
  Widget _buildHavAnacount(){
    return Container(
      alignment: Alignment.center,
      child: Row(mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Don't have an account ?",
            style: TextStyle(color: Colors.black,fontSize: 18),
          ),
          FlatButton(
            color: Colors.transparent,
            onPressed: onLoginClicked,
            child: Text(
              'Join us',
              style: TextStyle(color: Color(0xff2BAA4A),fontSize: 18),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildLoginBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () => login(context,emailTextFiled.text, passwrodTextFiled.text),
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Color(0xff2BAA4A),
        child: Text(
          'LOGIN',
          style: TextStyle(
            color: Colors.white,
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }

  Widget _buildSignInWithText() {
    return Column(
      children: <Widget>[
        Text(
          '- OR -',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(height: 20.0),
        Text(
          'Sign Up',
          style: kLabelStyle,
        ),
      ],
    );
  }
  Widget _buildLoginTextDowon() {
    return Container(
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () => onSignUpClicked(),
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.transparent,
        child: Text(
          'Signup',
          style: TextStyle(
            color: Colors.white,
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }
  Widget _buildGuestTextDowon() {
    return Container(
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () => print("Guest"),
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.transparent,
        child: Text(
          'Guest',
          style: TextStyle(
            color: Colors.white,
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }

  Widget _buildSignUpWithGuest(){
    return Row(
      children: <Widget>[
        Expanded(
          child: _buildLoginTextDowon(),
        ),
        Expanded(
          child: _buildGuestTextDowon(),
        )
      ],
    );
  }
  Future<void>setUserID(String uid)async{
//    SharedPreferences prefs=await SharedPreferences.getInstance();
//    prefs.setString('uid', uid);
//    prefs.setString('guest', '0');
//    pr.hide();
//
//    Navigator.of(context).push(MaterialPageRoute(builder: (context) => MainPage()));
  }
  login(BuildContext context,String email,String password)async{
//    SharedPreferences prefs=await SharedPreferences.getInstance();
//    var uid=prefs.get("SessionID");
//    pr.show();
//    Map data= {
//      "email": email.trim(),
//      "password": password.trim()
//    };
//    var body=jsonEncode(data);
//    var response= await http.post("https://rightclick.sa/projects/saud/api/rest/login",
//        headers: {'X-Oc-Merchant-Id': 'SRQ7pJJG1VBXpQY5RPpUIigh3BdCl4He',
//          'X-Oc-Session':uid}
//        ,body: body);
//    var jsonData=jsonDecode(response.body);
//    if(response.statusCode==200){
//      // print(jsonData);
//      var curid=jsonData['data']['customer_id'];
//      print("cu_id $curid ");
//      setUserID(curid);
//    }else{
//      pr.hide();
//      print(jsonData);
//
//      showAlertDialog(context);
//    }
  }
  showAlertDialog(BuildContext context) {

    // set up the button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed:  () => Navigator.of(context).pop(true),
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Authentication failed"),
      content: Text("error email or password."),
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
//  ProgressDialog pr;
  @override
  Widget build(BuildContext context) {
 //   pr = new ProgressDialog(context);
    return new Scaffold(
        body: new Stack(
          children: <Widget>[
            ListView(
              children: <Widget>[
                new Container(
                  color: Colors.white,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: 0,right:0,top: 0),
                        child:new Container(
                          height: 250,
                          width: 300,
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

                      Container(
                          padding: EdgeInsets.only(top: 10,left: 30,right: 30),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children:<Widget>[
                                Text(
                                  'Welcom Back',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25,
                                      fontStyle: FontStyle.normal
                                  ),
                                ),
                                Text(
                                  'Nice to see you again',
                                  style: TextStyle(
                                      color: Color(0xffA2A2A2),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      fontStyle: FontStyle.normal
                                  ),
                                ),
                                _buildEmailTF(),
                                _buildPasswordTF(),
                                _buildForgotPasswordBtn(),
                                _buildLoginBtn(),
                                _buildHavAnacount()
                              ]
                          )
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        )
    );
  }
}