import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';

class Utils{
  static void fieldFocusChange(
      BuildContext context,
      FocusNode currentFocus,
      FocusNode nextFocus,
      ){
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }
  static flushBarErrorMessage(String message,BuildContext context){
    showFlushbar(context: context,
        flushbar: Flushbar(
          message: message,
          margin: EdgeInsets.symmetric(horizontal: 30,vertical: 8),
          padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
          icon: Icon(Icons.error,color: Colors.white,size: 30,),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 5),
          borderRadius: BorderRadius.circular(10),
          flushbarPosition: FlushbarPosition.TOP,
        )..show(context),

    );
  }
}