import 'package:fall_detection/core/extensions/context_extension.dart';
import 'package:fall_detection/core/routes/routes.dart';
import 'package:fall_detection/core/styles/colors/colors.dart';
import 'package:fall_detection/core/common/widgets/elevated_button_widget.dart';
import 'package:fall_detection/core/common/widgets/text_form_feild_widget.dart';
import 'package:fall_detection/core/utils/spacing.dart';
import 'package:fall_detection/feature/auth/presentation/Manger/Cubits/AuthCubit/Auth_Cubit.dart';
import 'package:fall_detection/feature/auth/presentation/Manger/Cubits/AuthCubit/Auth_States.dart';
import 'package:fall_detection/feature/auth/presentation/widgets/signup_container.dart';
import 'package:fall_detection/feature/auth/presentation/widgets/text_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});
  static String id = '/signup';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _nameController.dispose();
    _genderController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthStates>(
      listener: (context, state) {
        if (state is SignUpSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Success", style: TextStyle(color: Colors.white)),
            backgroundColor: Colors.blue,
          ));
          Navigator.pushNamed(context, Routes.activateUsrAccount);
        } else if (state is SignUpFailure) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(state.errMessage,
                style: const TextStyle(color: Colors.white)),
            backgroundColor: Colors.blue,
          ));
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.primaryColor,
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                const SignupContainer(),
                Container(
                  height: MediaQuery.of(context).size.height * 0.79,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    // color: Colors.red,
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(85),
                    ),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 16.h, horizontal: 28.w),
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Form(
                        key: _key,
                        child: Column(
                          children: [
                            verticalSpace(10),
                            TextFormFieldWidget(
                              controller: context.read<AuthCubit>().signUpEmail,
                              keyboardType: TextInputType.emailAddress,
                              onChanged: (value) {},
                              hintText: 'Enter Your Email',
                              icon: Icons.email_outlined,
                              validator: (value) {
                                if (value!.isEmpty ||
                                    !value.contains('@') ||
                                    !value.contains('.com')) {
                                  return 'Please Enter Email';
                                } else {
                                  return null;
                                }
                              },
                            ),
                            verticalSpace(20),
                            TextFormFieldWidget(
                              obscureText: true,
                              controller:
                                  context.read<AuthCubit>().signUpPassword,
                              keyboardType: TextInputType.visiblePassword,
                              onChanged: (value) {},
                              hintText: 'Password',
                              icon: Icons.password_outlined,
                              validator: (value) {
                                if (value!.isEmpty || value.length < 6) {
                                  return 'Please Enter Correct Password';
                                } else {
                                  return null;
                                }
                              },
                            ),
                            verticalSpace(20),
                            TextFormFieldWidget(
                              controller: context.read<AuthCubit>().signUpName,
                              keyboardType: TextInputType.name,
                              onChanged: (value) {},
                              hintText: 'Name',
                              icon: Icons.person_outline,
                              validator: (value) {
                                if (value!.isEmpty || value.length < 2) {
                                  return 'Please Enter Name';
                                } else {
                                  return null;
                                }
                              },
                            ),
                            verticalSpace(20),
                            TextFormFieldWidget(
                              controller:
                                  context.read<AuthCubit>().signUpGender,
                              keyboardType: TextInputType.name,
                              onChanged: (value) {},
                              hintText: 'Gender',
                              icon: Icons.male_outlined,
                              validator: (value) {
                                if (value!.isEmpty || value.length < 2) {
                                  return 'Please Enter Gender';
                                }
                                return null;
                              },
                            ),
                            verticalSpace(20),
                            TextFormFieldWidget(
                              controller:
                                  context.read<AuthCubit>().signUpPhoneNumber,
                              keyboardType: TextInputType.phone,
                              onChanged: (value) {},
                              hintText: 'Phone',
                              icon: Icons.phone_android_outlined,
                              validator: (value) {
                                if (value!.isEmpty || value.length < 10) {
                                  return 'Please Enter Phone';
                                }
                                return null;
                              },
                            ),
                            verticalSpace(20),
                            state is SignUpLoading
                                ? const CircularProgressIndicator()
                                : ElevatedButtonWidget(
                                    tap: () {
                                      if (_key.currentState!.validate()) {
                                        context.read<AuthCubit>().signUp();
                                        // Navigator.pushNamed(context, '/login');
                                        //context.pushName(Routes.loginInScreen);
                                      } else {
                                        print('error');
                                      }
                                    },
                                    title: 'Sign up',
                                  ),
                            verticalSpace(5),
                            ButtonTextWidget(
                              tap: () {
                                // Navigator.pushNamed(context, '/login');
                                context.pushName(Routes.loginInScreen);
                              },
                              title: 'Already have an account? Log in',
                            )
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
