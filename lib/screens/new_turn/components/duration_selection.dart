import 'package:delicias_turns_app/utils/constants.dart';
import 'package:delicias_turns_app/utils/custom_colors.dart';
import 'package:delicias_turns_app/utils/custom_styles.dart';
import 'package:delicias_turns_app/utils/time_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class DurationSelection extends StatelessWidget {
  DurationSelection({this.selectedDuration, this.increase, this.decrease});

  final int selectedDuration;
  final Function increase;
  final Function decrease;

  Widget _buildButton(IconData icon, Function onTap, bool enabled) {
    return GestureDetector(
      onTap: enabled ? onTap : null,
      child: Container(
        height: 30,
        width: 30,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: enabled ? CustomColors.kMainColor : CustomColors.kGreyColor,
            width: 2,
          ),
        ),
        child: Icon(
          icon,
          color: enabled ? CustomColors.kMainColor : CustomColors.kGreyColor,
        ),
      ),
    );
  }

  Widget _buildDurationDisplay(int duration) {
    return Container(
      height: 40,
      width: 140,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Constants.kCardBorderRadius),
        border: Border.all(color: CustomColors.kMainColor, width: 2),
      ),
      child: Text(
        TimeUtils.getDurationFromIndex(duration),
        style: CustomStyles.kSelectionCardStyle,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildButton(Icons.remove, decrease, selectedDuration > 1),
        SizedBox(
          width: 10,
        ),
        _buildDurationDisplay(selectedDuration),
        SizedBox(
          width: 10,
        ),
        _buildButton(Icons.add, increase, selectedDuration < 4),
      ],
    );
  }
}
