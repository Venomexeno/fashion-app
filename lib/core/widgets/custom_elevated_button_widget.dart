import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomElevatedButtonWidget extends StatelessWidget {
  const CustomElevatedButtonWidget({
    super.key,
    required this.onPressed,
    this.buttonText,
    this.borderRadius,
    this.widget,
    this.backgroundColor,
    this.foregroundColor,
    this.borderSide,
  });

  final VoidCallback onPressed;
  final String? buttonText;
  final double? borderRadius;
  final Widget? widget;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final BorderSide? borderSide;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        side: borderSide ?? borderSide,
        backgroundColor: backgroundColor ?? backgroundColor,
        foregroundColor: foregroundColor ?? foregroundColor,
        fixedSize: Size(double.maxFinite, 80.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 50.r),
        ),
      ),
      onPressed: onPressed,
      child: widget ??
          Text(
            buttonText!,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.sp,
            ),
          ),
    );
  }
}
