import 'package:delicias_turns_app/models/turn.dart';
import 'package:delicias_turns_app/utils/constants.dart';
import 'package:delicias_turns_app/utils/custom_colors.dart';
import 'package:delicias_turns_app/utils/custom_styles.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TurnsList extends StatelessWidget {
  final List<Turn> turns = [
    Turn(
        activity: Activity.Tennis,
        court: "Cancha 1",
        duration: 3,
        date: DateTime.now(),
        uid: "0"),
    Turn(
        activity: Activity.Paddle,
        court: "Cancha 4",
        duration: 3,
        date: DateTime.now(),
        uid: "0"),
    Turn(
        activity: Activity.Tennis,
        court: "Cancha 7",
        duration: 3,
        date: DateTime.now(),
        uid: "0"),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "  Mis turnos",
          style: CustomStyles.kSubtitleStyle,
        ),
        SizedBox(
          height: 10,
        ),
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) => TurnsListItem(turns[index]),
            itemCount: turns.length,
          ),
        ),
      ],
    );
  }
}

class TurnsListItem extends StatelessWidget {
  TurnsListItem(this._turn);
  final Turn _turn;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Constants.kCardBorderRadius),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  _turn.activity.toString().split(".").last +
                      " - " +
                      _turn.court,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Spacer(),
                Icon(
                  Icons.timer,
                  size: 20,
                  color: CustomColors.kMainColor,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  "2 horas",
                  style: TextStyle(color: CustomColors.kMainColor),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              DateFormat("EEEE, dd MMM HH:mm").format(_turn.date),
              style: TextStyle(
                color: CustomColors.kGreyColor,
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
