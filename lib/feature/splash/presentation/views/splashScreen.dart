import 'package:fall_detection/feature/splash/presentation/views/widgets/SplashScreenBody.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);
  static String id='/splash';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff00A9FF),
      body: SplashScreenBody(),
    );
  }
}
