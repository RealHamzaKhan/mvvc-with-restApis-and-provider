import 'package:flutter/material.dart';
import 'package:mvvm/res/colors.dart';

import '../text_styles.dart';
class RoundedButton extends StatelessWidget {
  final String title;
  final VoidCallback onPress;
  final bool loading;
  const RoundedButton({Key? key,required this.title,
    this.loading=false,
    required this.onPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        height: 50,
        width: 200,
        decoration: BoxDecoration(
          color: AppColors.green,
          borderRadius: BorderRadius.circular(15),
        ),
        child:Center(child:loading?CircularProgressIndicator(color: Colors.white,):Text(title,style: RoundedButtonTextstyle,),) ,
      ),
    );
  }
}
