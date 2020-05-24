
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


import 'package:http/http.dart' as http;
import 'package:lqtifa/Utilites/Constants.dart';

class SignUpScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState()=>_SignUpScreenState();
}
class _SignUpScreenState extends State<SignUpScreen> {
  onSignUpClicked() async {

    register();
    //Navigator.of(context).push(MaterialPageRoute(builder: (context) => MainPage()));
  }
  onLoginClicked() async {

   // Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginScreen()));
  }
  register()async{
//    pr.show();
//    Map data={
//      "firstname": firstNameFiled.text,
//      "lastname": lastNameFiled.text,
//      "email": emailTextFiled.text,
//      "password": passwordTextFiled.text,
//      "confirm": confirmPasswordFiled.text,
//      "telephone": phoneNumberFiled.text,
//      "agree": "1"
//    };
//    var body=jsonEncode(data);
//    var response= await http.post("https://rightclick.sa/projects/saud/api/rest/register/register",
//        headers: {'X-Oc-Merchant-Id': 'SRQ7pJJG1VBXpQY5RPpUIigh3BdCl4He'},
//        body: body);
//    print(jsonDecode(response.body));
//    pr.hide();
//    if(response.statusCode==200){
//      SharedPreferences prefs=await SharedPreferences.getInstance();
//      prefs.setString('guest', '0');
//      Navigator.of(context).push(MaterialPageRoute(builder: (context) => MainPage()));
//
//    }else{
//      pr.hide();
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
      content: Text("check all data"),
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

 // ProgressDialog pr;
  final emailTextFiled=new TextEditingController();
  final passwordTextFiled=new TextEditingController();
  final confirmPasswordFiled=new TextEditingController();
  final phoneNumberFiled=new TextEditingController();
  final firstNameFiled=new TextEditingController();
  final lastNameFiled=new TextEditingController();
  Widget _buildEmailTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 10.0),
        Text(
          'Email',
          style: kHintTextStyleGezara,
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
              hintText: 'Email',
              hintStyle: kHintTextStyleGezara,
            ),
          ),
        ),
      ],
    );
  }
  Widget _buildPhoneTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 10.0),
        Text(
          'Enter your phone number',
          style: kHintTextStyleGezara,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyleGezara,
          height: 60.0,
          child: TextField(
            controller: phoneNumberFiled,
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.phone,
                color: Colors.black,
              ),
              hintText: 'Enter your phone number',
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
        SizedBox(height: 10.0),
        Text(
          "password",
          style: kHintTextStyleGezara,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyleGezara,
          height: 60.0,
          child: TextField(
            controller: passwordTextFiled,
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
  Widget _buildConfrimPasswordTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 10.0),
        Text(
          'confrim password',
          style: kHintTextStyleGezara,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyleGezara,
          height: 60.0,
          child: TextField(
            controller: confirmPasswordFiled,
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
  Widget _buildLoginBtn() {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () => onSignUpClicked(),
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Color(0xff2BAA4A),
        child: Text(
          'SignUp',
          style: TextStyle(
            color: Color(0xFFffffff),
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }
  Widget _buildHavAnacount(){
    return Container(
      alignment: Alignment.center,
      child: Row(mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Have an account?',
            style: TextStyle(color: Colors.black,fontSize: 20),
          ),
          FlatButton(
            color: Colors.transparent,
            onPressed: onLoginClicked,
            child: Text(
              'Login',
              style: TextStyle(color: Color(0xff2BAA4A),fontSize: 20),
            ),
          )
        ],
      ),
    );
  }
  bool _rememberMe=false;
  Widget _buildRememberMeCheckbox() {
    return Container(
      height: 20.0,
      child: Row(
        children: <Widget>[
          Theme(
            data: ThemeData(unselectedWidgetColor: Colors.black12),
            child: Checkbox(
              value: _rememberMe,
              checkColor: Colors.green,
              activeColor: Colors.black12,
              onChanged: (value) {
                setState(() {
                  _rememberMe = value;
                });
              },
            ),
          ),
          Row(
            children: <Widget>[
              Text(
                'Agree With ',
                style: kHintTextStyleGezara,
              ),
              Text(
                ' Terms and Condtions',
                style: kHintTextStyleGezaraTerms,
              ),
            ],
          )

        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //pr = new ProgressDialog(context);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            alignment: Alignment.bottomCenter,
            image: AssetImage('assets/signup_logo.png')
          )
        ),
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 30,left: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Nice to Meet You',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          fontStyle: FontStyle.normal
                      ),
                    ),
                    Text(
                      'Join us ,We Care.',
                      style: TextStyle(
                          color: Color(0xffA2A2A2),
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          fontStyle: FontStyle.normal
                      ),
                    ),
                    SizedBox(height:10.0),
                    Divider(height: 10,color: Color(0xff707070),thickness: .2,),
                  ],
                ),
              )
              ,

//              Container(
//                height: double.infinity,
//                width: double.infinity,
//                decoration: BoxDecoration(
//                    color: Colors.white
//                ),
//              ),
//              Column(
//                  children: <Widget>[
//                    new Container(
//                      height: 190,
//                      width: 500,
//                      decoration: new BoxDecoration(
//                        image: new DecorationImage(image:
//                        new AssetImage("assets/login_bk.png"),
//                            fit: BoxFit.fill
//                        ),
//                      ),
//                      child: Image(
//                        image: AssetImage('assets/logo_white.png'),
//                      ),
//                    ),
//                  ]
//              ),
              Container(
                height: double.infinity,
                padding: EdgeInsets.only(top: 80),
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 5.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height:10.0),
                      _buildEmailTF(),
                      SizedBox(height:10.0),
                      _buildPhoneTF(),
                      SizedBox(height:10.0),
                      _buildPasswordTF(),
                      SizedBox(height:10.0),
                      _buildConfrimPasswordTF(),
                      SizedBox(height:10.0),
                      _buildRememberMeCheckbox(),
                      SizedBox(height:10.0),
                      _buildLoginBtn(),
                      _buildHavAnacount()
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