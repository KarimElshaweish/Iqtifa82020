import 'package:flutter/cupertino.dart';
import 'package:lqtifa/pages/about_page.dart';
import 'package:lqtifa/pages/change_password_page.dart';
import 'package:lqtifa/pages/home_page.dart';

class Routes{
  static Map<String,WidgetBuilder> getRoute(){
    return  <String, WidgetBuilder>{
      '/': (_) => MainHome(),
      //'pay':(_) => PaymentMethod()
    };
  }
}