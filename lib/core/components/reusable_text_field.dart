import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_manager_app/core/constants/color_constants.dart';

import 'reusable_text_field_border.dart';

class ReusableTextField extends StatefulWidget {
  final String hintText;
  final bool obscureText;
  final IconData? icon;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  const ReusableTextField({
    required this.hintText,
    this.obscureText = false,
    this.icon,
    this.keyboardType,
    this.controller,
    this.validator,
    super.key,
  });

  @override
  ReusableTextFieldState createState() => ReusableTextFieldState();
}

class ReusableTextFieldState extends State<ReusableTextField> {
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: _focusNode,
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      validator: widget.validator,
      obscureText: widget.obscureText,
      decoration: InputDecoration(
        prefixIcon: widget.icon != null
            ? Padding(
                padding: EdgeInsets.symmetric(vertical: 12.h),
                child: Icon(
                  widget.icon,
                  color: _focusNode.hasFocus
                      ? ColorConstants.primaryElement
                      : ColorConstants.primarySecondaryElementText,
                  size: 24.w,
                ),
              )
            : null,
        hintText: widget.hintText,
        hintStyle: const TextStyle(
          color: ColorConstants.primarySecondaryElementText,
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
        border: customTextFieldBorder(
          color: ColorConstants.primarySecondaryElementText,
        ),
        enabledBorder: customTextFieldBorder(
          color: ColorConstants.primarySecondaryElementText,
        ),
        disabledBorder: customTextFieldBorder(),
        focusedBorder: customTextFieldBorder(
          color: ColorConstants.primaryElement,
        ),
      ),
      style: TextStyle(
        color: ColorConstants.primaryText,
        fontFamily: "Avenir",
        fontWeight: FontWeight.normal,
        fontSize: 14.sp,
      ),
      autocorrect: false,
    );
  }
}
