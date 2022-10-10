import 'package:mvvm/data/network/BaseApiServices.dart';
import 'package:mvvm/res/App_urls.dart';

import '../data/network/NetworkApiServices.dart';

class AuthRepository{
  BaseApiServices _apiServices=NetworkApiServices();
  Future<dynamic> loginApi(dynamic data)async{
    try{
      dynamic response=await _apiServices.getPostApiResponse(AppUrls.loginEndPointUrl, data);
      return response;
    }
    catch(e){
      throw e;
    }
  }
  Future<dynamic> registerApi(dynamic data)async{
    try{
      dynamic response=await _apiServices.getPostApiResponse(AppUrls.RegisterEndPointUrl, data);
      return response;
    }
    catch(e){
      throw e;
    }
  }
}