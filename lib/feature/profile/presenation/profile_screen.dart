import 'package:fall_detection/core/common/cubit/app_cubit/app_cubit.dart';
import 'package:fall_detection/core/common/cubit/app_cubit/app_state.dart';
import 'package:fall_detection/core/extensions/context_extension.dart';
import 'package:fall_detection/core/styles/colors/colors.dart';
import 'package:fall_detection/core/styles/images/assets.dart';
import 'package:fall_detection/core/utils/spacing.dart';
import 'package:fall_detection/feature/profile/presenation/Manger/Cubits/UserCubit/UserCupit.dart';
import 'package:fall_detection/feature/profile/presenation/Manger/Cubits/UserCubit/UserStates.dart';
import 'package:fall_detection/feature/profile/presenation/refacor/LogoutDialog.dart';
import 'package:fall_detection/feature/profile/presenation/refacor/edit_profile_dialoge.dart';
import 'package:fall_detection/feature/profile/presenation/widgets/row_info_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppState>(
      listener: (context, state) {
        if(state is AppFailerState){
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                state.errorMessage,
                style: const TextStyle(color: Colors.white),
              ),
              backgroundColor: AppColors.primaryColor,
            ),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: state is AppLoadingState?Center(child: const CircularProgressIndicator(),):state is AppSuccessState?
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.white,
                  AppColors.primaryColor,
                ],
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(
                top: context.height * 0.1,
                left: context.width * 0.1,
                right: context.width * 0.1,
                bottom: context.height * 0.1,
              ),
              child: Center(
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: context.height * 0.6,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                            top: context.height * 0.078,
                            left: context.width * 0.05,
                            right: context.width * 0.05,
                            bottom: context.height * 0.1,
                          ),
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: Text(
                                  '${state.user.name}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(
                                    fontSize: 22,
                                  ),
                                ),
                              ),
                              verticalSpace(48),
                               RowInfoWidget(
                                icon: Icons.male,
                                text: '${state.user.gender}',
                              ),
                              verticalSpace(16),
                               RowInfoWidget(
                                icon: Icons.phone,
                                text: '${state.user.phone}',
                              ),
                              verticalSpace(16),
                               RowInfoWidget(
                                icon: Icons.person_add_alt_rounded,
                                text:'${state.user.patients.length} Followings' ,
                              ),
                              verticalSpace(16),
                              RowInfoWidget(
                                onTap: () {
                                  showDialog(
                                      context: context,

                                      builder: (context) {

                                        return EditProfileDialge();
                                      }
                                  );
                                },
                                icon: Icons.edit,
                                text: 'Edit Profile',
                              ),
                              verticalSpace(16),
                              RowInfoWidget(
                                onTap: () {
                                  showDialog(context: context, builder: (context) {
                                    return LogoutDialog();
                                  },);
                                },
                                icon: Icons.logout_outlined,
                                text: 'Log out',
                              ),
                              verticalSpace(16),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      // top: context.height * 0.1,
                      left: context.width * 0.22,
                      right: context.width * 0.22,
                      bottom: context.height * 0.46,
                      child: Container(
                        height: context.height * 0.3,
                        width: context.height * 0.3,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          // color: Colors.red,
                        ),
                        child: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          radius: context.height * 0.15,
                          backgroundImage: NetworkImage(state.user.photo),

                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ):Container(),
        );
      },
    );
  }
}
