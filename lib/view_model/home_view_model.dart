import 'package:flutter/cupertino.dart';
import 'package:mvvm/data/response/api_response.dart';
import 'package:mvvm/repository/home_repository.dart';

import '../model/UserListModel.dart';

class HomeViewModel with ChangeNotifier{
  final _myrepo=HomeRepository();
  ApiResponse<UserListModel> userList=ApiResponse.loading();
  setUserList(ApiResponse<UserListModel> response){
    userList=response;
    notifyListeners();
  }
  Future<void> fetchUserListApi()async{
    setUserList(ApiResponse.loading());
    _myrepo.fetchUserList().then((value){
      setUserList(ApiResponse.completed(value));
    }).onError((error, stackTrace){
      setUserList(ApiResponse.error(error.toString()));
    });
  }

}