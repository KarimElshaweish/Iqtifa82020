
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lqtifa/Utilites/Constants.dart';

class ChangePassword extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _ChangePassword();
}
class _ChangePassword extends State<ChangePassword>{
  var languages=["English","Arablic"];
  List<DropdownMenuItem<String>>_dropDownMenuItems;
  String _selectedLang;
  List<DropdownMenuItem<String>> buildAndGetDropDownMenuItems(List langauges) {
    List<DropdownMenuItem<String>> items = new List();
    for (String langu in langauges) {
      items.add(new DropdownMenuItem(value: langu, child: new Text(langu)));
    }
    return items;
  }
  @override
  void initState() {
    _dropDownMenuItems=buildAndGetDropDownMenuItems(languages);
    _selectedLang=_dropDownMenuItems[0].value;
    super.initState();
  }
  void changedDropDownItem(String slectedLang) {
    setState(() {
      _selectedLang = slectedLang;
    });
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

  Widget _buildLoginBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 50.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () => setLanguage(context),
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color:Color(0xff2BAA4A),
        child: Text(
          'confirm changes',
          style: TextStyle(
            color: Colors.white,
            fontSize: 17.0,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }
  Widget _buildSaveBtn() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 50.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () => setLanguage(context),
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
            side: BorderSide(color:Color(0xff2BAA4A),width: 2 )
        )


        ,
        color:Colors.white,
        child: Text(
          'confirm changes',
          style: TextStyle(
            color: Color(0xff2BAA4A),
            fontSize: 17.0,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }
  final passwordTextFiled=new TextEditingController();
  final confirmPasswordFiled=new TextEditingController();
  Widget _buildPasswordTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 10.0),
        Text(
          "Old Password",
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
              contentPadding: EdgeInsets.only(top: 14.0,left: 14.0),
              hintText: 'Enter your Old Password',
              hintStyle: kHintTextStyleGezara,
            ),
          ),
        ),
      ],
    );
  }
  Widget _buildNewPasswordTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 10.0),
        Text(
          'New Password',
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
              contentPadding: EdgeInsets.only(top: 14.0,left:14.0),
              hintText: 'Enter your New Password',
              hintStyle: kHintTextStyleGezara,
            ),
          ),
        ),
      ],
    );
  }
  Widget _buildConfirmNewPasswordTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 10.0),
        Text(
          'Confirm New Password',
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
              contentPadding: EdgeInsets.only(top: 14.0,left:14.0),
              hintText: 'Confirm New Password',
              hintStyle: kHintTextStyleGezara,
            ),
          ),
        ),
      ],
    );
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
                width: double.infinity,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        alignment: Alignment.bottomCenter,
                        image: AssetImage('assets/signup_logo.png')
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
                            Center(
                              child: Text(
                                'Edit Profile Information',
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
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          children: <Widget>[
                            SizedBox(height: 10.0),
                            _buildPasswordTF(),
                            SizedBox(
                                height: 10
                            ),
                            _buildNewPasswordTF(),
                            SizedBox(
                                height: 10
                            ),
                            _buildConfirmNewPasswordTF(),
                            //   _buildEmailTF(),
                            SizedBox(
                              height: 10.0,
                            ),
                            _buildLoginBtn(),
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