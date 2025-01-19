import 'package:first_project/core/themes/app_colors.dart';
import 'package:first_project/core/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShowBottomSheetWidget extends StatelessWidget {
  const ShowBottomSheetWidget({
    super.key,
    required this.map,
    required this.historyAddressesWidget,
    required this.containerBorderRadius,
    required this.containerColor,
  });

  final Map map;
  final Color containerColor;
  final double containerBorderRadius;
  final Widget historyAddressesWidget;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppConstants.screenHeight(context) / 2.2,
      decoration: BoxDecoration(
        color: containerColor,
        borderRadius: BorderRadius.circular(containerBorderRadius),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 30.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              // child: Text("Delivery to", style: VStyles.h6Bold(context)),
            ),
            SizedBox(height: 15.h),
            // AddNewAddressWidget(onTap: () => context.pushNamed(VRoutesName.choiceYourLocationRoute, arguments: map)),
            SizedBox(height: 15.h),
            Expanded(
              child: historyAddressesWidget,
            ),
          ],
        ),
      ),
    );
  }
}
