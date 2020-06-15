
import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lqtifa/Services/Auth.dart';
import 'package:lqtifa/Utilites/Constants.dart';
import 'package:lqtifa/pages/sign_up_page.dart';

import 'home_screen_page.dart';


class LoginScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState()=>_LoginScreenState();
}
class _LoginScreenState extends State<LoginScreen> {
  bool _rememberMe = false;

  get email => null;
  onSignUpClicked() async {

  //  Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignUpScreen()));
  }
  onLoginClicked() async {

    Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignUpScreen()));
  }
  void performLogin()async {
    Auth auth = new Auth();
    var value = await auth.signIn(emailTextFiled.text.trim().toString(),
        passwrodTextFiled.text.trim().toString());
    if (value != null){
      Route route = MaterialPageRoute(builder: (context) => Setting());
      Navigator.pushReplacement(context, route);
    }
    else
      errorLogin();
  }

  final scaffoldKey = new GlobalKey<ScaffoldState>();
  final formKey = new GlobalKey<FormState>();
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
          child: TextFormField(
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
          child: TextFormField(
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
  changePasswordRequest()async{
    try {
      String emailForget = emailTextFiled.text.toString();
      print('email:$emailForget');
      if (emailForget.contains('@')) {
        FirebaseAuth.instance.sendPasswordResetEmail(email: emailForget);
        Fluttertoast.showToast(
            msg: "password sent to your email",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black54,
            textColor: Colors.white,
            fontSize: 16.0
        );
      } else {
        Fluttertoast.showToast(
            msg: "please enter your email correclty",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black54,
            textColor: Colors.white,
            fontSize: 16.0
        );
      }
    }catch(e){
      print(e);
    }
  }
  Widget _buildForgotPasswordBtn() {
    return Container(
      alignment: Alignment.centerRight,
      child: FlatButton(
        onPressed: () => changePasswordRequest(),
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
    if (email.contains('@')) {
      performLogin();
    }else{
      errorLogin();
    }
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
          key: scaffoldKey,
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
  void errorLogin(){
    showAlertDialog(context);
  }
}