import 'package:fall_detection/core/extensions/context_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/common/widgets/elevated_button_widget.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/styles/colors/colors.dart';
import '../../../../core/utils/spacing.dart';

class Resetpassworddone extends StatelessWidget {
  const Resetpassworddone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon:  Icon(
            Icons.arrow_back,
            color: AppColors.primaryColor,
          ),
        ),
      ),

      body: SingleChildScrollView(
        child: Padding(

          padding:  EdgeInsets.symmetric(horizontal: 15.0.w),
          child: Center(
            child: Column(

              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                verticalSpace(120),
                Image(image: AssetImage('assets/images/Capa_1.png')),
                verticalSpace(20),
                Text('Congratulations ',style: TextStyle(fontSize: 32.sp,fontWeight: FontWeight.w700),),
                Text('your password has been ',style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.w700),),
                Text('successfully changed',style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.w700),),


               // verticalSpace(100),


                verticalSpace(240),

                ElevatedButtonWidget(
                  title: 'Done',
                  tap: (){
                  Navigator.pushNamed(context, Routes.loginInScreen) ;
                  },
                )
                //Please enter your email so we can
              ],
            ),
          ),
        ),
      ),
    );
  }
}
