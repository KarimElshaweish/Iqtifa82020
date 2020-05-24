import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lqtifa/themes/theme.dart';
import 'config/route.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'اقتفاء ',
      theme:  AppTheme.lightTheme.copyWith(
        textTheme: GoogleFonts.muliTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      debugShowCheckedModeBanner: false ,
      routes: Routes.getRoute(),
      onGenerateRoute: (RouteSettings settings ){
        final List<String> pathElements = settings.name.split('/');
//        if(pathElements[1].contains('detail')){
//          return CustomRoute<bool>(builder:(BuildContext context)=> ProductDetailPage());
//        }

      },
    );
  }
}