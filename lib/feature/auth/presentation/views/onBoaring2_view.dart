import 'package:fall_detection/core/extensions/context_extension.dart';
import 'package:fall_detection/core/utils/spacing.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/common/widgets/elevated_button_widget.dart';
import '../../../../core/routes/routes.dart';
import '../widgets/text_button_widget.dart';

class onBoaringScreen2 extends StatelessWidget {
  const onBoaringScreen2 ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: Container(
      padding: EdgeInsets.only(top: 40.h,right: 15.w,left: 15.w),
      child: SingleChildScrollView(
        child: Column(
        children: [
          Align(
          alignment: Alignment.bottomRight,
          child: GestureDetector(
            onTap: (){
              Navigator.pushNamed(context, Routes.loginInScreen);
            },
              child: Text('Skip',style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.w400),))),
          verticalSpace(45),
          Stack(
            children: [
              Image(image: AssetImage('assets/images/Rectangle 26.png')),
              Positioned(
                top: context.height*0.2,
                  left: context.width*0.3,
                  child: Image(image: AssetImage('assets/images/path4133.png'))),
              Positioned(
                  top: context.height*0.1,
                  left: context.width*0.4,
                  child: Image(image: AssetImage('assets/images/path4133.png'))),
              Positioned(
                  top: context.height*0.08,
                  left: context.width*0.2,
        
                  child: Image(image: AssetImage('assets/images/path4133.png'))),
        
            ],
          ),
          verticalSpace(100),
          Align(
            alignment: Alignment.center,
              child: Column(
                children: [
                  Text('Notification by location ',style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.w400,),),
                  Text('of falling will be sent ',style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.w400,),),
                ],
              )),
        verticalSpace(50),
          ElevatedButtonWidget(
            title: 'Next',
            tap: (){
           Navigator.pushNamed(context, Routes.onBoardingScreen3);
            },
          ),
            verticalSpace(60),
          ButtonTextWidget(
            title: 'Sign in now',
            tap: () {
              // Navigator.pushNamed(context, LoginScreen.id);
              context.pushName(Routes.loginInScreen);
            },
          )
        
        //
        
          ],
        ),
      ),
    ),
    );
  }
}
