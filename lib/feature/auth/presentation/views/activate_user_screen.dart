import 'package:fall_detection/core/common/widgets/elevated_button_widget.dart';
import 'package:fall_detection/core/styles/colors/colors.dart';
import 'package:fall_detection/core/utils/spacing.dart';
import 'package:fall_detection/feature/auth/data/logic/activate_cubit/activate_cubit.dart';
import 'package:fall_detection/feature/auth/data/logic/activate_cubit/activate_state.dart';
import 'package:fall_detection/feature/auth/presentation/Manger/Cubits/AuthCubit/Auth_Cubit.dart';
import 'package:fall_detection/feature/auth/presentation/widgets/otp_verification_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/routes/routes.dart';

class ActivateUserAccount extends StatelessWidget {
  const ActivateUserAccount({super.key});

  @override
  Widget build(BuildContext context) {
    final activateCubit = BlocProvider.of<ActivateUserCubit>(context);
    final authCubit = BlocProvider.of<AuthCubit>(context);
    return BlocConsumer<ActivateUserCubit, ActivateUserState>(
      listener: (context, state) {
        if (state is OTPResendSuccess) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(state.message)),
        );
      } else if (state is OTPResendFailure) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: ${state.error}')),
        );
      }

      },
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.only(
                top: 20.h,
                bottom: 26.h,
                left: 25.w,
                right: 25.w,
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: InkWell(
                        onTap: () {},
                        child: Icon(
                          Icons.arrow_back,
                          size: 32.sp,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ),
                    verticalSpace(40),
                    const Center(
                      child: Text(
                        'Verification',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w600,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ),
                    verticalSpace(4),
                    Text(
                      'We have send you a code to verify your',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: AppColors.primaryColor.withOpacity(0.5),
                      ),
                    ),
                    verticalSpace(100),
                    OTPVerificationWidget(
                      controllers: activateCubit.otpControllers,
                      onChanged: (value) {},
                    ),
                    verticalSpace(20),
                    Align(
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Didn\'t receive the code?',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              // color: AppColors.primaryColor.withOpacity(0.5),
                            ),
                          ),
                          // verticalSpace(10),
                          InkWell(
                            onTap: (){
                              context.read<ActivateUserCubit>().resendOTP(authCubit.signUpEmail.text,'verify-email');
                            },
                            child: Text(
                              '  Resend Code',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: AppColors.primaryColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    verticalSpace(40),
                    ElevatedButtonWidget(
                      title: 'Contanue',
                      tap: () {
                        activateCubit.activateUser(
                          authCubit.signUpEmail.text,
                        );
                        Navigator.pushNamed(context, Routes.loginInScreen);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
