import 'package:delicias_turns_app/utils/constants.dart';
import 'package:delicias_turns_app/utils/custom_colors.dart';
import 'package:delicias_turns_app/utils/custom_styles.dart';
import 'package:delicias_turns_app/utils/time_utils.dart';
import 'package:flutter/material.dart';

class HourSelection extends StatefulWidget {
  HourSelection(this.selectedIndex, this.select);
  final Function select;
  final int selectedIndex;
  @override
  _HourSelectionState createState() => _HourSelectionState();
}

class _HourSelectionState extends State<HourSelection> {
  Widget _buildHourCard(int index) {
    final selected = index == widget.selectedIndex;

    return Expanded(
      child: InkWell(
        onTap: () {
          widget.select(index);
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
              TimeUtils.getHourFromIndex(index),
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

  Widget _buildHourRow(int startingIndex) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      children: [
        _buildHourCard(startingIndex),
        _buildHourCard(startingIndex + 1),
        _buildHourCard(startingIndex + 2),
        _buildHourCard(startingIndex + 3),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          _buildHourRow(0),
          _buildHourRow(4),
          _buildHourRow(8),
        ],
      ),
    );
  }
}
