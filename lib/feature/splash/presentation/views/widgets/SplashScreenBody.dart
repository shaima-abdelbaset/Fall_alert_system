import 'package:fall_detection/feature/splash/presentation/views/widgets/sliderWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/routes/routes.dart';

class SplashScreenBody extends StatefulWidget {
  const SplashScreenBody({Key? key}) : super(key: key);

  @override
  State<SplashScreenBody> createState() => _SplashScreenBodyState();
}

class _SplashScreenBodyState extends State<SplashScreenBody> with SingleTickerProviderStateMixin{
  late AnimationController controler;
  late Animation<Offset> animate;

  @override
  void initState() {
    super.initState();
    controler =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    animate = Tween<Offset>(begin: const Offset(0, 2), end: Offset.zero)
        .animate(controler);
    controler.forward();

    Future.delayed(const Duration(seconds: 2), () {
     Navigator.pushNamed(context, Routes.onBoardingScreen);
    });
  }


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controler.dispose();
  }

  @override
  Widget build(BuildContext context) {
   return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Align(
          alignment: Alignment.center,
          child: Text('FallGruad ',style: TextStyle(color: Colors.white,fontSize: 40.sp,fontWeight: FontWeight.w900,shadows:<Shadow> [
            Shadow(
              offset: Offset(2.0, 4.0), // offset of shadow
              blurRadius: 1.0, // blur radius of shadow
              color: Colors.black,

              // color of shadow
            ),
          ]),),
        ),
        const SizedBox(
          height: 5,
        ),
        sliderWidget(animate: animate)
      ],
    );
  }
}
