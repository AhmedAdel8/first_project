import 'package:first_project/core/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDropdownButtonWidget<T> extends StatelessWidget {
  final String? hint;
  final T? value;
  final List<T> items;
  final bool isString;
  final String Function(T)? getItemText;
  final ValueChanged<T?>? onChanged;
  final String? Function(T?)? validator;

  const CustomDropdownButtonWidget({
    super.key,
    this.hint,
    this.value,
    this.isString = true,
    required this.items,
    this.getItemText,
    this.onChanged,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      value: value,
      hint: hint != null ? Text(hint!) : null,
      icon: const Icon(Icons.arrow_drop_down_sharp),
      onChanged: onChanged,
      dropdownColor: Colors.white,
      items: items.map((T item) {
        return DropdownMenuItem<T>(
          value: item,
          child: SizedBox(
            child: Text(
              isString ? item.toString() : getItemText!(item),
              style:
              TextStyle(fontSize: 14.sp, color: AppColors.primaryTextColor),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        );
      }).toList(),
      validator: validator,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: const BorderSide(
            color: AppColors.greyColor,
            width: 1.0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: const BorderSide(
            color: AppColors.greyColor,
            width: 1.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: const BorderSide(
            color: AppColors.greyColor,
            width: 1.0,
          ),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
      ),
    );
  }
}