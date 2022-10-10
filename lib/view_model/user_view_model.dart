import 'package:flutter/material.dart';
import 'package:mvvm/model/UserModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserViewModel with ChangeNotifier{


  Future<bool> saveUser(UserModel user)async{
    SharedPreferences sp=await SharedPreferences.getInstance();
    sp.setString('token', user.token.toString());
    notifyListeners();
    return true;
  }
  Future<UserModel> getUser()async{
    final SharedPreferences sp=await SharedPreferences.getInstance();
    final String? token=sp.get('token') as String?;
    return UserModel(
      token: token.toString()
    );
  }
  Future<bool> removeUser()async{
    final SharedPreferences sp=await SharedPreferences.getInstance();
    return sp.remove('token');
  }
}