import 'package:flutter/cupertino.dart';
import 'package:lqtifa/pages/about_page.dart';
import 'package:lqtifa/pages/detials_page.dart';
import 'package:lqtifa/pages/edit_profile_information_page.dart';
import 'package:lqtifa/pages/home_page.dart';
import 'package:lqtifa/pages/home_screen_page.dart';
import 'package:lqtifa/pages/locaion_live.dart';
import 'package:lqtifa/pages/map_page.dart';
import 'package:lqtifa/pages/sign_up_page.dart';
import 'package:lqtifa/pages/splash_screen_page.dart';

import '../pages/login_page.dart';

class Routes{
  static Map<String,WidgetBuilder> getRoute(){
    return  <String, WidgetBuilder>{
      '/': (_) => SplashScreen(),
      //'pay':(_) => PaymentMethod()
    };
  }
}