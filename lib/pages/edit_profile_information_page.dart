
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lqtifa/Utilites/Constants.dart';
import 'package:lqtifa/pages/home_screen_page.dart';

class EditProfileInformation extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _EditProfileInformation();
}
class _EditProfileInformation extends State<EditProfileInformation>{

  @override
  void initState(){
    super.initState();
    getProfileImage();
  }
  String imageUrl="";
  getProfileImage()async{
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    DBRef.child('profileImages/${user.uid}').once().then((snapShot){
      print(snapShot.value['url']);
      setState(() {
        imageUrl=snapShot.value['url'];
      });
    });

  }
  getUserData()async {
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    setState(() {
      print(user.email);
      email = user.email.toString();
    });
  }
  changePasswordRequest()async{
    FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    Fluttertoast.showToast(
        msg: "password sent to your email",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black54,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }

  Widget _buildLoginBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 50.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
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
        onPressed: ()=>changePasswordRequest(),
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
          side: BorderSide(color:Color(0xff2BAA4A),width: 2 )
        )


        ,
        color:Colors.white,
        child: Text(
          'change password',
          style: TextStyle(
            color: Color(0xff2BAA4A),
            fontSize: 17.0,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }
  final emailTextFiled=new TextEditingController();
  String email="";
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
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child:Text('$email') ,
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
    child: Padding(
    padding: EdgeInsets.all(10.0),
    child:Text('*********') ,
    ),
    ),
      ],
    );
  }
  File _image;
  final picker=ImagePicker();
  Future getImageFromGaller()async{
    final pickedFile=await picker.getImage(source: ImageSource.gallery);
    setState(() {
      _image=File(pickedFile.path);
      uploadToFirbase();
    });
  }
  var DBRef=FirebaseDatabase.instance.reference();
  uploadToFirbase()async{
    try {
      FirebaseUser user = await FirebaseAuth.instance.currentUser();
      final StorageReference storageReference = FirebaseStorage.instance.ref()
          .child('profilesImage/${_image.path
          .split('/')
          .last}');
      StorageUploadTask uploadTask = storageReference.putFile(_image);
      await uploadTask.onComplete;
      print('uploade');
      storageReference.getDownloadURL().then((value) {
        DBRef.child('profileImages/${user.uid}').set({
        'url': value
        });
        print('Download url:${value}');
      });
    }catch(e){
      print(e);
    }
  }
  @override
  Widget build(BuildContext context) {
getUserData();
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
                              child: GestureDetector(
                                onTap: ()=>Navigator.of(context).push(
                                    MaterialPageRoute(builder: (context) =>
                                        Setting())),
                                child: Align(
                                    alignment: Alignment.topRight,
                                    child: Image(
                                      image: AssetImage('assets/menu.png'),
                                    )
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 10,),
                      new GestureDetector(
                        onTap: ()=>getImageFromGaller(),
                        child:new Container(
                          width: 150,
                          height: 150,
                          decoration: new BoxDecoration(
                              color: Colors.black87,
                              image: new DecorationImage(
                                image: _image==null?imageUrl==null?new AssetImage('assets/avatar_man.jpg'):NetworkImage(imageUrl):
                                FileImage(_image),
                                fit: BoxFit.cover,
                                colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.4), BlendMode.dstATop),
                              ),
                              borderRadius: new BorderRadius.all(new Radius.circular(75.0)),
                              border: Border.all(
                                  color: Color(0xff0DB14B),
                                  width: 2.0
                              )
                          ),
                          child: Center(
                            child: Image(
                              image: AssetImage(
                                  'assets/camera.png'
                              ),
                            ),
                          ),
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          children: <Widget>[
                            SizedBox(height: 10.0),
                            _buildEmailTF(),
                            SizedBox(
                                height: 10
                            ),
                            _buildPasswordTF(),
                            //   _buildEmailTF(),
//                            SizedBox(
//                              height: 10.0,
//                            ),
//                            _buildLoginBtn(),
                            SizedBox(
                              height: 10.0,
                            ),
                            _buildSaveBtn()
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