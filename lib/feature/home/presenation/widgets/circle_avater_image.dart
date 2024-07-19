import 'package:fall_detection/core/styles/colors/colors.dart';
import 'package:fall_detection/core/styles/images/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CircleAvaterImage extends StatelessWidget {
  const CircleAvaterImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          CircleAvatar(
            radius: 30.r,
            backgroundColor: AppColors.primaryColor,
            child: CircleAvatar(
              radius: 28.r,
              backgroundImage: const AssetImage(
                AppAssetsImages.onboardingImage,
              ),
            ),
          ),
          const Text(
            'Patient1',
            style: TextStyle(
              fontSize: 12,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
