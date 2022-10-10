import 'package:flutter/material.dart';
import 'package:mvvm/data/App_exceptions.dart';
import 'package:mvvm/repository/auth_repository.dart';
import 'package:mvvm/utils/routes/routes_name.dart';
import 'package:mvvm/utils/utils.dart';
import 'package:mvvm/view_model/user_view_model.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/UserModel.dart';

class AuthViewModel with ChangeNotifier{
  bool _registerloading=false;
  bool get registerloading=>_registerloading;
  setregisterLoading(bool value){
    _registerloading=value;
    notifyListeners();
  }
  bool _loading=false;
  bool get loading=>_loading;
  setLoading(bool value){
    _loading=value;
    notifyListeners();

  }
  final _myrepo=AuthRepository();
  Future<dynamic> loginApi(dynamic data,BuildContext context)async{
    SharedPreferences sp=await SharedPreferences.getInstance();
    setLoading(true);
    _myrepo.loginApi(data).then((value){
      final userPreference = Provider.of<UserViewModel>(context , listen: false);
      userPreference.saveUser(
          UserModel(
              token: value['token'].toString()
          )
      );
      Utils.flushBarErrorMessage('Login Succesfully', context);
      Navigator.pushNamed(context, RoutesName.homescreen);
      setLoading(false);
    }).onError((error, stackTrace){
      Utils.flushBarErrorMessage(FetchDataException('.Try again').toString(), context);
      setLoading(false);
    });
  }

  Future<dynamic> registerApi(dynamic data,BuildContext context)async{
    setregisterLoading(true);
    _myrepo.registerApi(data).then((value){
      Utils.flushBarErrorMessage('Register Succesfully', context);
      Navigator.pushNamed(context, RoutesName.homescreen);
      setregisterLoading(false);
    }).onError((error, stackTrace){
      Utils.flushBarErrorMessage(FetchDataException('.Try again').toString(), context);
      setregisterLoading(false);
    });
  }

}