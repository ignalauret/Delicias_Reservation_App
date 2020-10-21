import 'package:delicias_turns_app/utils/custom_colors.dart';
import 'package:flutter/material.dart';

class CustomStyles {
  static const TextStyle kBoldTitleStyle = TextStyle(
    color: Colors.black,
    fontSize: 28,
    fontWeight: FontWeight.bold,
  );

  static const kMainTitleStyle = TextStyle(
    color: CustomColors.kMainColor,
    fontSize: 24,
    fontWeight: FontWeight.w600,
  );

  static const kTitleStyle = TextStyle(
    color: Colors.black,
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );

  static const kSubtitleStyle = TextStyle(
    color: CustomColors.kGreyColor,
    fontSize: 18,
  );

  static const kAppBarTitle = TextStyle(
    color: CustomColors.kGreyColor,
    fontSize: 16,
  );

  static const kSelectionCardStyle = TextStyle(
    color: CustomColors.kMainColor,
    fontSize: 15,
    fontWeight: FontWeight.w600,
  );
}
