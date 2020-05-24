import 'package:flutter/cupertino.dart';
import 'package:lqtifa/pages/login_page.dart';
import 'package:lqtifa/pages/sign_up_page.dart';
import 'package:lqtifa/pages/splash_screen_page.dart';

class Routes{
  static Map<String,WidgetBuilder> getRoute(){
    return  <String, WidgetBuilder>{
      '/': (_) => SignUpScreen(),
      //'pay':(_) => PaymentMethod()
    };
  }
}