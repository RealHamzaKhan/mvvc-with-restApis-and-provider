import 'package:flutter/material.dart';
import 'package:mvvm/view_model/services/splash_screen_services.dart';
class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  SplashScreenService splashScreenService=SplashScreenService();
  @override
  void initState() {
    super.initState();
    splashScreenService.checkAuthentication(context);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Splash Screen',style: Theme.of(context).textTheme.headline1,),
      ),
    );
  }
}
