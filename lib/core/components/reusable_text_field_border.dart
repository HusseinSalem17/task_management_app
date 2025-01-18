import 'package:flutter/material.dart';

import '../constants/color_constants.dart';

OutlineInputBorder customTextFieldBorder({
  Color color = ColorConstants.primarySecondaryElementText,
}) {
  return OutlineInputBorder(
    borderRadius: const BorderRadius.all(Radius.circular(12)),
    borderSide: BorderSide(
      color: color,
    ),
  );
}
