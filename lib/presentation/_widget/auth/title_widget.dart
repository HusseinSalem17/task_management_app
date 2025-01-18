import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/constants/color_constants.dart';

Text titleWidget() {
  return Text(
    'Task Management App',
    style: GoogleFonts.lato(
      fontSize: 32,
      color: ColorConstants.primaryElement,
      fontWeight: FontWeight.bold,
    ),
  );
}
