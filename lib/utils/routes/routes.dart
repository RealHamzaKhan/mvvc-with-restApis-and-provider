
import 'package:flutter/material.dart';
import 'package:mvvm/utils/routes/routes_name.dart';
import 'package:mvvm/views/home_screen.dart';
import 'package:mvvm/views/login_screen.dart';
import 'package:mvvm/views/registration_screen.dart';
import 'package:mvvm/views/splash_view.dart';

class Routes{
  static MaterialPageRoute generateRoute(RouteSettings routeSettings){
    switch(routeSettings.name){
      case RoutesName.homescreen:
        return MaterialPageRoute(builder: (BuildContext context)=>HomeScreen());
      case RoutesName.loginscreen:
        return MaterialPageRoute(builder: (BuildContext context)=>LoginScreen());
      case RoutesName.registrationscreen:
        return MaterialPageRoute(builder: (BuildContext context)=>RegisterationScreen());
      case RoutesName.splashscreen:
        return MaterialPageRoute(builder: (BuildContext context)=>SplashView());
      default:
        return MaterialPageRoute(builder: (_){
          return Scaffold(
            body: Center(
              child:Text('No routes defined'),
            ),
          );
        });
    }
  }
}