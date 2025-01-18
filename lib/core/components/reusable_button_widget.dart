import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_manager_app/core/constants/color_constants.dart';

Widget reusableButtonWidget({
  required String buttonName,
  bool isPrimary = true,
  void Function()? onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      width: 325.w,
      height: 50.h,
      margin: EdgeInsets.only(
        left: 25.w,
        right: 25.w,
        top: isPrimary ? 40.h : 20.h,
      ),
      decoration: BoxDecoration(
        color: isPrimary
            ? ColorConstants.primaryElement
            : ColorConstants.primaryBackground,
        borderRadius: BorderRadius.circular(
          15.w,
        ),
        border: Border.all(
          color: isPrimary
              ? Colors.transparent
              : ColorConstants.primaryFourthElementText,
        ),
        boxShadow: [
          BoxShadow(
            spreadRadius: 1,
            blurRadius: 2,
            offset: const Offset(0, 1),
            color: Colors.grey.withOpacity(0.1),
          ),
        ],
      ),
      child: Center(
        child: Text(
          buttonName,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.normal,
            color: isPrimary
                ? ColorConstants.primaryBackground
                : ColorConstants.primaryText,
          ),
        ),
      ),
    ),
  );
}
