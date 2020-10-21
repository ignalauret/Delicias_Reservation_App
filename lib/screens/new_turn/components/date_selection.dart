import 'package:delicias_turns_app/utils/constants.dart';
import 'package:delicias_turns_app/utils/custom_colors.dart';
import 'package:delicias_turns_app/utils/custom_styles.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TurnSelection extends StatelessWidget {
  TurnSelection(this.selectedIndex, this.startingDate, this.select);

  final int selectedIndex;
  final DateTime startingDate;
  final Function select;

  Widget _buildDateCard(DateTime date, int index) {
    final selected = index == selectedIndex;
    return Expanded(
      child: InkWell(
        onTap: () {
          select(index);
        },
        child: Container(
          height: 70,
          margin: EdgeInsets.symmetric(horizontal: 5),
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
              "${DateFormat("EE").format(date)} \n ${date.day}",
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

  List<Widget> _buildDateCards(DateTime startingDate) {
    return List.generate(
      6,
      (index) => _buildDateCard(startingDate.add(Duration(days: index)), index),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: _buildDateCards(startingDate),
      ),
    );
  }
}
