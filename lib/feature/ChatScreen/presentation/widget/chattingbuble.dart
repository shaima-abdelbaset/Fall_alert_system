import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:fall_detection/core/styles/colors/colors.dart';

class ChatBuble extends StatelessWidget {
  const ChatBuble({super.key, required this.message});
  final String message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: EdgeInsets.only(
          left: 16.w,
          top: 32.h,
          bottom: 32.h,
          right: 16.w,
        ), // Ensure all padding values are provided
        margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32.r),
            topRight: Radius.circular(32.r),
            bottomLeft: Radius.circular(32.r),
          ),
          color: Colors.lightBlue,
        ),
        child: Text(
          message,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
