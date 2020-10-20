import 'package:delicias_turns_app/utils/constants.dart';
import 'package:delicias_turns_app/utils/custom_colors.dart';
import 'package:flutter/material.dart';

class DangerButton extends StatelessWidget {
  DangerButton({this.label, this.onTap});

  final String label;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: size.height * 0.08,
        width: size.width * 0.7,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(color: CustomColors.kRedColor, width: 1),
          borderRadius: BorderRadius.circular(Constants.kCardBorderRadius),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: CustomColors.kRedColor,
            fontSize: 22,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
