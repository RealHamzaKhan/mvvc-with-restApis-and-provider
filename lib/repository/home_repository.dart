import 'package:mvvm/model/UserListModel.dart';

import '../data/network/BaseApiServices.dart';
import '../data/network/NetworkApiServices.dart';
import '../res/App_urls.dart';

class HomeRepository{
  BaseApiServices _apiServices=NetworkApiServices();
  Future<UserListModel> fetchUserList()async{
    try{
      dynamic response=await _apiServices.getGetApiResponse(AppUrls.userListEndpointurl);
      return response=UserListModel.fromJson(response);
    }
    catch(e){
      throw e;
    }
  }
}