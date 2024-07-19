import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/common/widgets/elevated_button_widget.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/utils/spacing.dart';
import '../widgets/text_button_widget.dart';

class OnboardingView3 extends StatelessWidget {
  const OnboardingView3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Container(
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
              Image(image: AssetImage('assets/images/image 4.png')),
          
              verticalSpace(100),
              Align(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Text('Quick rescue of the ',style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.w400,),),
                      Text('fallen person',style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.w400,),),
                    ],
                  )),
              verticalSpace(50),
              ElevatedButtonWidget(
                title: 'Next',
                tap: (){
                  Navigator.pushNamed(context, Routes.loginInScreen);
                },
              ),
              verticalSpace(60),
              ButtonTextWidget(
                title: 'Sign in now',
                tap: () {
                   Navigator.pushNamed(context,Routes.loginInScreen );
                 // context.pushName(Routes.loginInScreen);
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
