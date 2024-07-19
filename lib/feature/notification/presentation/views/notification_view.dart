import 'package:fall_detection/core/common/cubit/app_cubit/app_cubit.dart';
import 'package:fall_detection/core/common/cubit/app_cubit/app_state.dart';
import 'package:fall_detection/core/styles/images/assets.dart';
import 'package:fall_detection/feature/notification/presentation/widget/notification_card_info.dart';
import 'package:fall_detection/core/styles/colors/colors.dart';
import 'package:fall_detection/core/utils/spacing.dart';
import 'package:fall_detection/feature/notification/presentation/widget/all_notification_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {
        if (state is AppFailerState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.blue,
              content: Text(state.errorMessage),
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is AppLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is AppLoadedSuccess2) {
          final notifications = state.notifications!.data;

          // Debug: Print notifications list length and contents
          print('Notifications count: ${notifications.length}');
          print(
              'Notifications data: ${notifications.map((e) => e.content).toList()}');

          if (notifications.isEmpty) {
            return Scaffold(
              backgroundColor: AppColors.primaryColor,
              body: Center(
                child: Text(
                  'No notifications available',
                  style: TextStyle(color: Colors.white, fontSize: 18.sp),
                ),
              ),
            );
          }

          return Scaffold(
            backgroundColor: AppColors.primaryColor,
            body: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: 40.h,
                    left: 20.w,
                    right: 20.w,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                      ),
                      verticalSpace(12.h),
                      const AllNotificationText(),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40.r),
                        topRight: Radius.circular(40.r),
                      ),
                    ),
                    child: ListView.builder(
                      itemCount: notifications.length,
                      itemBuilder: (context, index) {
                        final notification = notifications[index];

                        // Debug: Print notification data
                        print(
                            'Notification content: ${notification.content}');

                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: NotificationContainerInfo(
                            icon: Icons.phone,
                            content: notification.content ?? '',
                            min: notification.createdAt ??
                                DateTime.now().toIso8601String(),
                            image: AppAssetsImages.fallingImage,
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          );
        } else {
          return const Center(child: Text('Unexpected state'));
        }
      },
    );
  }
}
