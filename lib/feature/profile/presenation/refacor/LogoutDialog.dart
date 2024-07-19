import 'package:fall_detection/core/extensions/context_extension.dart';
import 'package:fall_detection/core/utils/spacing.dart';
import 'package:fall_detection/feature/auth/presentation/Manger/Cubits/AuthCubit/Auth_Cubit.dart';
import 'package:fall_detection/feature/auth/presentation/Manger/Cubits/AuthCubit/Auth_States.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/routes/routes.dart';

class LogoutDialog extends StatelessWidget {
  const LogoutDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthStates>(
      listener: (context, state) {
        if (state is AuthLoggedOut) {
          // Navigate to the login screen
          Navigator.pushNamed(context, Routes.loginInScreen);
        } else if (state is LogoutError) {
          // Show error message
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.blue, content: Text(state.message)));
        }
      },
      builder: (context, state) {
        return Dialog(
          backgroundColor: Colors.white,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0.w),
            child: SingleChildScrollView(
              child: Container(
                width: context.width * 0.8,
                height: context.height * 0.3,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(16.r)),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            ' log out?',
                            style: TextStyle(
                                fontSize: 25.sp, fontWeight: FontWeight.w800),
                          ),
                        ),
                        verticalSpace(20),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Are you sure you want to log out?',
                            maxLines: 2,
                            style: TextStyle(
                                fontSize: 17.sp, fontWeight: FontWeight.w500),
                          ),
                        ),
                        verticalSpace(40),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  'Cancle',
                                  style: TextStyle(
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w900,
                                      color: Colors.black),
                                )),
                            TextButton(
                                onPressed: () {
                                  context.read<AuthCubit>().logout();
                                },
                                child: Text(
                                  'Log out',
                                  style: TextStyle(
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w900,
                                      color: Colors.red),
                                ))
                          ],
                        )
                      ],
                    ),
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
