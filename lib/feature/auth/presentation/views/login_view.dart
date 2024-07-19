import 'package:fall_detection/core/extensions/context_extension.dart';
import 'package:fall_detection/core/routes/routes.dart';
import 'package:fall_detection/core/utils/spacing.dart';
import 'package:fall_detection/feature/auth/presentation/Manger/Cubits/AuthCubit/Auth_Cubit.dart';
import 'package:fall_detection/feature/auth/presentation/Manger/Cubits/AuthCubit/Auth_States.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:fall_detection/core/styles/colors/colors.dart';
import 'package:fall_detection/core/common/widgets/elevated_button_widget.dart';
import 'package:fall_detection/core/common/widgets/text_form_feild_widget.dart';
import 'package:fall_detection/feature/auth/presentation/views/signup_view.dart';
import 'package:fall_detection/feature/auth/presentation/widgets/signin_container.dart';
import 'package:fall_detection/core/styles/colors/colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static String id = '/login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthStates>(
      listener: (context, state) {
        if (state is SignInSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                "success",
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.blue,
            ),
          );

          Navigator.pushNamed(context, Routes.bottomNavBarScreen);
        } else if (state is SignInFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errMessage,
                  style: const TextStyle(color: Colors.white)),
              backgroundColor: Colors.blue,
            ),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.primaryColor,
          appBar: AppBar(
            backgroundColor: AppColors.primaryColor,
            elevation: 0,
            leading: IconButton(
              onPressed: () {
                context.pop();
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, Routes.sighupScreen);
                },
                child: const Text(
                  'Sign Up',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                const SigninContainer(),
                Container(
                  height: MediaQuery.of(context).size.height * 0.77,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(85),
                    ),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
                    child: Form(
                      key: _key,
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Column(
                          children: [
                            verticalSpace(40),
                            TextFormFieldWidget(
                              controller: context.read<AuthCubit>().signInEmail,
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
                            SizedBox(
                              height: 20.h,
                            ),
                            TextFormFieldWidget(
                              obscureText: true,
                              controller:
                                  context.read<AuthCubit>().signInPassword,
                              keyboardType: TextInputType.visiblePassword,
                              onChanged: (value) {},
                              hintText: 'Password',
                              icon: Icons.password_outlined,
                              validator: (value) {
                                if (value!.isEmpty || value.length < 6) {
                                  return 'Please Enter Correct Password';
                                }
                                return null;
                              },
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: TextButton(
                                onPressed: () {},
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, Routes.forgotPassword);
                                  },
                                  child: const Text(
                                    'Forget Password?',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            verticalSpace(20),
                            state is SignInLoading
                                ? const CircularProgressIndicator()
                                : SizedBox(
                                    height: 55.h,
                                    width: double.infinity,
                                    child: ElevatedButtonWidget(
                                      tap: () {
                                        if (_key.currentState!.validate()) {
                                          context.read<AuthCubit>().signIn();
                                          // Navigator.pushNamed(context, SignupScreen.id);
                                          // Navigator.pushNamedAndRemoveUntil(
                                          //     context,
                                          //     BottomNavBar.id,
                                          //     (Route<dynamic> route) => false);
                                          // context.pushAndRemoveUntil(
                                          // Routes.bottomNavBarScreen,
                                          // predicate: (_) => false,
                                          // fullscreenDialog: true,
                                          //  );
                                          // ignore: avoid_print
                                          print('validate');
                                        }
                                      },
                                      title: 'Log In',
                                    ),
                                  ),
                            verticalSpace(8),
                            TextButton(
                              onPressed: () {
                                // Navigator.pushNamed(context, SignUpScreen.id);
                                context.pushName(Routes.sighupScreen);
                              },
                              child: Text(
                                'need an account? Sign Up,',
                                style: TextStyle(
                                  color: Colors.grey.withOpacity(0.7),
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
