import 'package:fall_detection/core/styles/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:ibus_carrier_admin/core/styles/colors/app_color.dart';

class OTPVerificationWidget extends StatelessWidget {
  final List<TextEditingController> controllers;
  final ValueChanged<String>? onChanged;

  const OTPVerificationWidget({
    super.key,
    required this.controllers,
    required this.onChanged,
  }) : assert(controllers.length == 4, 'Four controllers are required.');

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(4, (index) {
        return _buildOTPField(index, context);
      }),
    );
  }

  Widget _buildOTPField(int index, BuildContext context) {
    return SizedBox(
      width: 60.w,
      child: TextFormField(
        controller: controllers[index],
        onChanged: (value) {
          if (value.length == 1 && index < 3) {
            FocusScope.of(context).nextFocus();
          } else if (value.isEmpty && index > 0) {
            FocusScope.of(context).previousFocus();
          }
          onChanged?.call(value);
        },
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            counterText: '',
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(
                color: AppColors.primaryColor,
                width: 2.0,
              ),
            ) // Hide the counter text
            ),
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        maxLength: 1,
      ),
    );
  }
}
