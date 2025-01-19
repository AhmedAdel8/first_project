import 'package:first_project/core/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormFieldWidget extends StatelessWidget {
  final TextEditingController? controller;
  final String? labelText;
  final String? hintText;
  final String? helperText;
  final String? errorText;
  final bool? obscureText;
  final bool? autofocus;
  final bool? autocorrect;
  final bool? enableSuggestions;
  final bool? readOnly;
  final bool? showCursor;
  final TextStyle? hintStyle;
  final TextStyle? textStyle;
  final bool isChat;
  final int? maxLength;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final ValueChanged<String>? onChanged;
  final String? Function(String?)? validator;
  final FormFieldSetter<String>? onSaved;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool? enabled;
  final Iterable<String>? autofillHints;
  final EdgeInsets? contentPadding;
  final EdgeInsets? padding;
  final bool? expands;
  final int? maxLines;
  final int? minLines;
  final ValueChanged<String>? onFieldSubmitted;
  final List<TextInputFormatter>? buildCounter;
  final ScrollPhysics? scrollPhysics;
  final VoidCallback? onTap;
  final BorderRadius? borderRadius;
  final Color? backgroundColor;
  final Color? borderColor;
  final double? borderWidth;
  final double? height;
  final TextAlignVertical? textAlignVertical;
  final FocusNode? focusNode;

  const CustomTextFormFieldWidget({
    super.key,
    this.controller,
    this.isChat = false,
    this.padding,
    this.textStyle,
    this.hintStyle,
    this.hintText,
    this.labelText,
    this.backgroundColor,
    this.helperText,
    this.borderColor,
    this.borderWidth,
    this.errorText,
    this.obscureText = false,
    this.autofocus = false,
    this.autocorrect = true,
    this.enableSuggestions = true,
    this.readOnly = false,
    this.showCursor,
    this.maxLength,
    this.keyboardType,
    this.textInputAction,
    this.onChanged,
    this.validator,
    this.borderRadius,
    this.onSaved,
    this.inputFormatters,
    this.prefixIcon,
    this.suffixIcon,
    this.enabled,
    this.autofillHints,
    this.contentPadding,
    this.expands,
    this.maxLines,
    this.minLines,
    this.onFieldSubmitted,
    this.buildCounter,
    this.scrollPhysics,
    this.onTap,
    this.height,
    this.textAlignVertical,
    this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: textStyle ??
          TextStyle(fontSize: 14.sp, color: AppColors.primaryTextColor),
      autofillHints: autofillHints,
      onTapOutside:
      isChat ? null : (event) => FocusScope.of(context).unfocus(),
      controller: controller,
      obscureText: obscureText!,
      autofocus: autofocus!,
      autocorrect: autocorrect!,
      focusNode: focusNode,
      enableSuggestions: enableSuggestions!,
      readOnly: readOnly!,
      showCursor: showCursor,
      maxLength: maxLength,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      onChanged: onChanged,
      validator: validator,
      onSaved: onSaved,
      inputFormatters: inputFormatters,
      textAlignVertical: textAlignVertical,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(10.r),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(10.r),
          borderSide: BorderSide(
            color: borderColor ?? AppColors.borderColor,
            width: borderWidth ?? 1.sp,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(10.r),
          borderSide: BorderSide(
            color: borderColor ?? AppColors.borderColor,
            width: borderWidth ?? 1.sp,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(10.r),
          borderSide: BorderSide(
            color: Colors.red,
            width: borderWidth ?? 1.sp,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(10.r),
          borderSide: BorderSide(
            color: Colors.red,
            width: borderWidth ?? 1.sp,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(10.r),
          borderSide: BorderSide(
            color: borderColor ?? AppColors.borderColor,
            width: borderWidth ?? 1.sp,
          ),
        ),
        labelText: labelText,
        hintStyle: hintStyle ??
            TextStyle(fontSize: 14.sp, color: AppColors.primaryTextColor),
        hintText: hintText,
        helperText: helperText,
        errorText: errorText,
        prefixIcon: prefixIcon,
        filled: true,
        suffixIcon: suffixIcon,
        prefixIconColor: AppColors.offerColor,
        suffixIconColor: AppColors.offerColor,
        enabled: enabled ?? true,
        contentPadding: contentPadding ??
            EdgeInsets.symmetric(horizontal: 15.w, vertical: height ?? 15.h),
        fillColor: backgroundColor ?? AppColors.scaffoldBackground,
      ),
      maxLines: isChat ? null : 1,
      minLines: isChat ? null : minLines,
      onFieldSubmitted: onFieldSubmitted,
      scrollPhysics: scrollPhysics,
      onTap: onTap,
    );
  }
}