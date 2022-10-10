import 'package:flutter/material.dart';
import 'package:mvvm/res/components/rounded_button.dart';
import 'package:mvvm/utils/utils.dart';
import 'package:mvvm/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

import '../utils/routes/routes_name.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  ValueNotifier<bool> _isobsecurepassword=ValueNotifier<bool>(true);
  TextEditingController _emailController=TextEditingController();
  TextEditingController _passswordController=TextEditingController();
  FocusNode _emailFocus=FocusNode();
  FocusNode _passwordFocus=FocusNode();
  @override
  void dispose() {
    _isobsecurepassword.dispose();
    _emailController.dispose();
    _passswordController.dispose();
    _emailFocus.dispose();
    _passwordFocus.dispose();
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final authViewModel=Provider.of<AuthViewModel>(context);
    final height=MediaQuery.of(context).size.height*1;
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              controller: _emailController,
              decoration: InputDecoration(
                hintText: 'Email',
                prefixIcon: Icon(Icons.email_outlined),
              ),
              focusNode: _emailFocus,
              onFieldSubmitted: (value){
                Utils.fieldFocusChange(context, _emailFocus, _passwordFocus);
              },
            ),
            SizedBox(height: height*0.006,),
            ValueListenableBuilder(
              valueListenable: _isobsecurepassword,
              builder: (context,value,child){
                return TextFormField(
                  obscureText: _isobsecurepassword.value,
                  controller: _passswordController,
                  decoration: InputDecoration(
                      hintText: 'Password',
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: GestureDetector(
                          onTap: (){
                            _isobsecurepassword.value=!_isobsecurepassword.value;
                          },
                          child: Icon(_isobsecurepassword.value==true?Icons.visibility:Icons.visibility_off))
                  ),
                  focusNode: _passwordFocus,
                );
              },
            ),
            SizedBox(height: height*0.1,),
            RoundedButton(title: 'Login', onPress: (){
              if(_emailController.text.isEmpty){
                Utils.flushBarErrorMessage('Enter Email', context);
              }
              else if(_passswordController.text.isEmpty){
                Utils.flushBarErrorMessage('Enter Password', context);
              }
              else if(_passswordController.text.length<6){
                Utils.flushBarErrorMessage('Password should be more than 6 letters', context);
              }
              else{
                // Map data={
                //   "email" : _emailController.text.toString(),
                //   "password" : _passswordController.text.toString()
                // };
                Map data={
                  "email" : "eve.holt@reqres.in",
                  "password" : "cityslicka"
                };
                authViewModel.loginApi(data,context);
              }
            },
            loading: authViewModel.loading,
            ),
            SizedBox(height: height*0.2,),
            GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context, RoutesName.registrationscreen);
                },
                child: Text('Dont have account? Signup')),
          ],
        ),
      ),
    );
  }
}
