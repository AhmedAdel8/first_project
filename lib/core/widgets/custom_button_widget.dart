import 'package:first_project/core/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButtonWidget extends StatelessWidget {
  final VoidCallback? onPressed;
  final IconData? iconData;
  final String? text;
  final Color? color;
  final Color? textColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final double borderRadius;
  final BorderSide? borderSide;
  final double? elevation;
  final bool? enableShadow;
  final bool? isEnabled;
  final List<Color>? gradientColors;
  final List<BoxShadow>? boxShadow;

  const CustomButtonWidget({
    super.key,
    this.onPressed,
    this.iconData,
    this.text,
    this.color,
    this.textColor,
    this.fontSize = 20,
    this.fontWeight,
    this.width,
    this.height,
    this.margin,
    this.padding,
    this.borderRadius = 18.0,
    this.borderSide,
    this.elevation,
    this.enableShadow,
    this.isEnabled,
    this.gradientColors,
    this.boxShadow,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(

        width: width ?? MediaQuery.of(context).size.width * 0.9,
        height: height ?? 50.h,
        margin: margin,
        padding: padding ?? EdgeInsets.symmetric(horizontal: 2.w),
        decoration: BoxDecoration(
          gradient: gradientColors != null
              ? LinearGradient(
              colors: gradientColors!,
              end: Alignment.bottomCenter,
              begin: Alignment.topCenter)
              : null,
          borderRadius: BorderRadius.circular(borderRadius),
          border: Border.all(color: borderSide?.color ?? Colors.transparent),
          color: color ?? AppColors.primaryColor,
          boxShadow: boxShadow ??
              [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: -1,
                  blurRadius: 5.sp,
                ),
              ],
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (iconData != null)
                Icon(
                  iconData,
                  color: textColor ?? Colors.white,
                  size: 25.sp,
                ),
              if (iconData != null) 7.horizontalSpace,
              Text(
                text!,
                style: TextStyle(
                  color: textColor ?? Colors.white,
                  fontSize: fontSize ?? 16.sp,
                  fontWeight: fontWeight,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}