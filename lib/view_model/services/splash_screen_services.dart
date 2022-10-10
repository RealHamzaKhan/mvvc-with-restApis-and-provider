import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mvvm/model/UserModel.dart';
import 'package:mvvm/utils/routes/routes_name.dart';
import 'package:mvvm/view_model/user_view_model.dart';

class SplashScreenService{
  Future<UserModel> getUserData()=>UserViewModel().getUser();
  void checkAuthentication(BuildContext context)async{
    getUserData().then((value) {
      print(value.token);
      if(value.token=='null' || value.token==''){
        Navigator.pushNamed(context, RoutesName.loginscreen);
      }
      else{
        Navigator.pushNamed(context, RoutesName.homescreen);
      }
    }).onError((error, stackTrace) {
      if(kDebugMode){
        print(error.toString());
      }
    });
  }
}