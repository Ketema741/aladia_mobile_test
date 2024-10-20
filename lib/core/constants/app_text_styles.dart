import 'package:aladia_flutter_test/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

// *********************** TEXT STYLES ****************************************
// Headings
var heading1Style = GoogleFonts.poppins(
  color: AppColors.primaryTextColor,
  fontSize: 24.sp,
  fontWeight: FontWeight.w700,
);

var heading2Style = GoogleFonts.poppins(
  color: AppColors.primaryTextColor,
  fontSize: 16.sp,
  fontWeight: FontWeight.w600,
  letterSpacing: 0.15,
);
var heading3Style = GoogleFonts.poppins(
  color: AppColors.primaryTextColor,
  fontSize: 14.sp,
  fontWeight: FontWeight.w600,
  letterSpacing: 0.15,
);
var heading4Style = GoogleFonts.poppins(
  color: AppColors.primaryTextColor,
  fontSize: 13.sp,
  fontWeight: FontWeight.w400,
  letterSpacing: 0.10,
);

// Text
var textPrimaryStyle = GoogleFonts.poppins(
  fontWeight: FontWeight.w500,
  color: AppColors.secondaryLightTextColor,
  fontSize: 14.sp,
  letterSpacing: 0.10,
);

var textPrimaryBoldStyle = GoogleFonts.poppins(
  fontWeight: FontWeight.bold,
  color: AppColors.secondaryLightTextColor,
  fontSize: 15.sp,
  letterSpacing: 0.10,
);
var redTextPrimaryBoldStyle = GoogleFonts.poppins(
  fontWeight: FontWeight.bold,
  color: AppColors.redColor,
  fontSize: 15.sp,
  letterSpacing: 0.10,
);

var textPrimaryLightStyle = GoogleFonts.poppins(
  fontWeight: FontWeight.w400,
  color: AppColors.secondaryLightTextColor,
  fontSize: 14.sp,
  letterSpacing: 0.10,
);

var textSecondaryWhiteStyle = GoogleFonts.poppins(
  color: AppColors.textWhiteColor,
  fontSize: 12.sp,
  fontWeight: FontWeight.w400,
  letterSpacing: 0.50,
);

var textSecondaryBlackStyle = GoogleFonts.poppins(
  color: AppColors.blackColor,
  fontSize: 12.sp,
  fontWeight: FontWeight.w400,
  letterSpacing: 0.50,
);

var textSecondaryStyle = GoogleFonts.poppins(
  color: AppColors.secondaryLightTextColor,
  fontSize: 12.sp,
  fontWeight: FontWeight.w400,
);

// Body Text
var bodyLargeStyle = GoogleFonts.poppins(
  color: AppColors.primaryTextColor,
  fontSize: 18.sp,
  fontWeight: FontWeight.w400,
  letterSpacing: 0.50,
);

var bodyTextStyle = GoogleFonts.poppins(
  color: AppColors.secondaryLightTextColor,
  fontSize: 12.sp,
  fontWeight: FontWeight.w400,
);

var bodyMediumStyle = GoogleFonts.poppins(
  color: AppColors.primaryTextColor,
  fontSize: 10.sp,
  fontWeight: FontWeight.w300,
);

// Titles and Subtitles
var titleStyle = GoogleFonts.poppins(
  color: AppColors.secondaryLightTextColor,
  fontSize: 12.sp,
  fontWeight: FontWeight.w400,
);

var subtitleStyle = GoogleFonts.poppins(
  color: AppColors.secondaryLightTextColor,
  fontWeight: FontWeight.w300,
  fontSize: 11.sp,
);

// *********************** BUTTON TEXT STYLES ****************************************
// Primary Button: Used for the main call to action
var buttonPrimaryStyle = GoogleFonts.poppins(
  color: AppColors.textWhiteColor,
  fontWeight: FontWeight.w600,
  fontSize: 16.sp,
);

// Secondary Button: Used for secondary actions
var buttonSecondaryStyle = GoogleFonts.poppins(
  color: AppColors.secondaryTextColor,
  fontWeight: FontWeight.w500,
  fontSize: 16.sp,
);

// Tertiary Button: Used for less important actions, often borderless
var buttonTertiaryStyle = GoogleFonts.poppins(
  // color: AppColors.tertiaryTextColor,
  fontWeight: FontWeight.w400,
  fontSize: 14.sp,
);

// Disabled Button: Used when a button is not actionable
var buttonDisabledStyle = GoogleFonts.poppins(
  // color: AppColors.disabledTextColor,
  fontWeight: FontWeight.w400,
  fontSize: 14.sp,
);

// Accent Button: Used for actions that require special attention or urgency
var buttonAccentStyle = GoogleFonts.poppins(
  // color: AppColors.accentTextColor,
  fontWeight: FontWeight.w600,
  fontSize: 16.sp,
);

// Small Button: Used for actions within cards or dialogs
var buttonSmallStyle = GoogleFonts.poppins(
  color: AppColors.primaryTextColor,
  fontWeight: FontWeight.w400,
  fontSize: 12.sp,
);

// Large Button: Used for prominent actions on main screens or modals
var buttonLargeStyle = GoogleFonts.poppins(
  color: AppColors.textWhiteColor,
  fontWeight: FontWeight.w700,
  fontSize: 18.sp,
);

// *********************** INPUT FIELD TEXT STYLES ****************************************
// Primary Input Field: Used for the main text entry in forms
var inputPrimaryStyle = GoogleFonts.poppins(
  color: AppColors.primaryTextColor,
  fontWeight: FontWeight.w500,
  fontSize: 16.sp,
);

// Secondary Input Field: Used for additional text entries
var inputSecondaryStyle = GoogleFonts.poppins(
  color: AppColors.secondaryTextColor,
  fontWeight: FontWeight.w400,
  fontSize: 14.sp,
);

// Placeholder/Hint Text: Style for placeholder text in input fields
var inputHintStyle = GoogleFonts.poppins(
  color:const Color.fromARGB(255, 85, 84, 84),
  fontSize: 16.sp,
  fontWeight: FontWeight.w500,
  letterSpacing: 0.50,
);

// Search Field: Specifically for search input fields
var inputSearchStyle = GoogleFonts.poppins(
  // color: AppColors.searchTextColor,
  fontWeight: FontWeight.w400,
  fontSize: 16.sp,
);

// Error Text: Style for error messages related to input validation
var inputErrorStyle = GoogleFonts.poppins(
  // color: AppColors.errorColor,
  fontWeight: FontWeight.w400,
  fontSize: 14.sp,
);

// Disabled Input Field: Style for input fields that are not editable
var inputDisabledStyle = GoogleFonts.poppins(
  // color: AppColors.disabledFieldColor,
  fontWeight: FontWeight.w400,
  fontSize: 16.sp,
);

// Label Text: Style for labels above input fields
var inputLabelStyle = GoogleFonts.poppins(
  // color: AppColors.labelTextColor,
  fontWeight: FontWeight.w600,
  fontSize: 14.sp,
);

// Input Field with Accent: For input fields that require special attention
var inputAccentStyle = GoogleFonts.poppins(
  // color: AppColors.accentTextColor,
  fontWeight: FontWeight.w500,
  fontSize: 16.sp,
);

// Large Input Field: For when the input field is a focal point, like a search bar on a home page
var inputLargeStyle = GoogleFonts.poppins(
  color: AppColors.primaryTextColor,
  fontWeight: FontWeight.w600,
  fontSize: 18.sp,
);

// Small Input Field: For subtler input fields or when space is constrained
var inputSmallStyle = GoogleFonts.poppins(
  color: AppColors.secondaryTextColor,
  fontWeight: FontWeight.w400,
  fontSize: 12.sp,
);
