import 'package:first_project/core/themes/app_colors.dart';
import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  /// TODO: mAKE Variable to make Check on is make call or not
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          color: AppColors.primaryColor,
        ),
      ),
    );
  }
}