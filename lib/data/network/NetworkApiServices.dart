
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:mvvm/data/network/BaseApiServices.dart';
import '../App_exceptions.dart';

class NetworkApiServices extends BaseApiServices{
  @override
  Future getGetApiResponse(String url) async{
    dynamic responseJson;
    try{
      final response=await http.get(Uri.parse(url)).timeout(Duration(seconds: 10));
      responseJson=returnResponse(response);
    }on SocketException{
      throw FetchDataException('No internet connection');
    }
    return responseJson;
  }

  @override
  Future getPostApiResponse(String url, data) async{
    dynamic responseJson;
    try{
      Response response= await post(
          Uri.parse(url),
          body: data
      ).timeout(Duration(seconds: 10));
      responseJson=returnResponse(response);
    }
    on SocketException{
      throw FetchDataException('No internet connection');
    }
    return responseJson;
  }
  dynamic returnResponse(http.Response response){
    switch(response.statusCode){
      case 200:
        dynamic responseJson=jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 404:
        throw UnauthorisedException(response.body.toString());
      default:
        throw FetchDataException('Error occured while communicating with server'
            ' with a status code '+response.statusCode.toString());
    }
  }
  
}