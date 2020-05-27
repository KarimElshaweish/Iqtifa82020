import 'package:flutter/cupertino.dart';
import 'package:lqtifa/pages/detials_page.dart';
import 'package:lqtifa/pages/map_page.dart';

class Routes{
  static Map<String,WidgetBuilder> getRoute(){
    return  <String, WidgetBuilder>{
      '/': (_) => DetialsPage(),
      //'pay':(_) => PaymentMethod()
    };
  }
}