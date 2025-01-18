import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget reusableText({
  required String text,
  TextAlign textAlign = TextAlign.start,
  Color color = Colors.black,
  double fontSize = 14.0,
  FontWeight fontWeight = FontWeight.normal,
  EdgeInsetsGeometry? margin,
}) {
  return Container(
    margin: margin,
    child: Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        color: color,
        fontSize: fontSize.sp,
        fontWeight: fontWeight,
      ),
    ),
  );
}
