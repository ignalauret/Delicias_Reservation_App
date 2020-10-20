import 'package:delicias_turns_app/utils/custom_colors.dart';
import 'package:delicias_turns_app/utils/custom_styles.dart';
import 'package:flutter/material.dart';

class HomeScreenHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            height: 50,
            width: 50,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: CustomColors.kRedColor.withOpacity(0.3),
            ),
            child: Text(
              "IL",
              style: TextStyle(
                color: CustomColors.kRedColor,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: size.height * 0.04,
          ),
          Container(
            width: double.infinity,
            alignment: Alignment.center,
            child: Text(
              "Bienvenido, Ignacio",
              style: CustomStyles.kBoldTitleStyle,
            ),
          )
        ],
      ),
    );
  }
}
