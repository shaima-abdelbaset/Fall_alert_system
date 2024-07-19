import 'package:fall_detection/core/extensions/context_extension.dart';
import 'package:fall_detection/core/utils/spacing.dart';
import 'package:fall_detection/feature/auth/data/logic/activate_cubit/activate_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/common/widgets/elevated_button_widget.dart';
import '../../../../core/common/widgets/text_form_feild_widget.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/styles/colors/colors.dart';
import '../../data/logic/activate_cubit/activate_state.dart';

class forgotPassword extends StatelessWidget {
   forgotPassword({Key? key}) : super(key: key);
  final TextEditingController _emailController = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ActivateUserCubit,ActivateUserState>(
      listener: (context, state) {
        if (state is ForgotPasswordSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.blue,
                content: Text(state.message,style: TextStyle(color: Colors.white))),
          );
          Navigator.pushNamed(context, Routes.resetPasswordCode);
        } else if (state is ForgotPasswordError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.blue,
                content: Text(state.error,style: TextStyle(color: Colors.white))),
          );
        }
      },

      builder: (context, state) {
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

          body: state is ForgotPasswordLoading? Center(child: const CircularProgressIndicator()): Form(
            key: _key,
            child: SingleChildScrollView(
              child: Padding(

                padding:  EdgeInsets.symmetric(horizontal: 15.0.w),
                child: Center(
                  child: Column(

                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      verticalSpace(20),
                      Text('Forgot Password?',style: TextStyle(fontSize: 32.sp,fontWeight: FontWeight.w700),),
                      Text('Please enter your email so we can',style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.w700),),
                      Text('send you averifcation code',style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.w700),),


                      verticalSpace(100),
                      TextFormFieldWidget(
                        controller: context.read<ActivateUserCubit>().resetPasswordemail,
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (value) {},
                        hintText: 'Enter Your Email',
                        icon: Icons.email_outlined,
                        validator: (value) {
                          if (value!.isEmpty ||
                              !value.contains('@') ||
                              !value.contains('.com')) {
                            return 'Please Enter Correct Email';
                          }
                          return null;
                        },

                      ),

                      verticalSpace(120),

                      ElevatedButtonWidget(
                        title: 'Send Reset Code',
                        tap: (){
                          if (_key.currentState!.validate()) {
                            print('validate');
                            context.read<ActivateUserCubit>().sendResetPasswordEmail();
                          }
                        },
                      )
                      //Please enter your email so we can
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },

    );
  }
}
