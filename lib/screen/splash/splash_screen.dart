import 'package:flutter/material.dart';
import 'package:auto_plus/screen/splash/components/body.dart';
import 'package:auto_plus/utils/size_config.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  static String routeName = '/splash';
  @override
  Widget build(BuildContext context) {
    // You have to call it on your starting screen
    SizeConfig().init(context);
    return Scaffold(
      body: Body(),
    );
  }
}
