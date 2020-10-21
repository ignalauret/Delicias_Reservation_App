import 'package:delicias_turns_app/utils/constants.dart';
import 'package:delicias_turns_app/utils/custom_colors.dart';
import 'package:delicias_turns_app/utils/custom_styles.dart';
import 'package:flutter/material.dart';

class CourtSelection extends StatelessWidget {
  CourtSelection(this.selectedIndex, this.select);
  final int selectedIndex;
  final Function select;

  Widget _buildCourtCard(int index) {
    final selected = index == selectedIndex;

    return Expanded(
      child: InkWell(
        onTap: () {
          select(index);
        },
        child: Container(
          height: 40,
          margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          decoration: BoxDecoration(
            color: selected ? CustomColors.kMainColor : Colors.white,
            borderRadius: BorderRadius.circular(Constants.kCardBorderRadius),
            border: selected
                ? null
                : Border.all(color: CustomColors.kMainColor, width: 2),
          ),
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              "Cancha ${index + 1}",
              textAlign: TextAlign.center,
              style: selected
                  ? CustomStyles.kSelectionCardStyle
                      .copyWith(color: Colors.white)
                  : CustomStyles.kSelectionCardStyle,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCourtRow(int startingIndex) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        _buildCourtCard(startingIndex),
        _buildCourtCard(startingIndex + 1),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          _buildCourtRow(0),
          _buildCourtRow(2),
        ],
      ),
    );
  }
}
