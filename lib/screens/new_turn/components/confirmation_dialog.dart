import 'package:delicias_turns_app/models/turn.dart';
import 'package:delicias_turns_app/utils/constants.dart';
import 'package:delicias_turns_app/utils/custom_colors.dart';
import 'package:delicias_turns_app/utils/custom_styles.dart';
import 'package:delicias_turns_app/utils/time_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';

class ConfirmationDialog extends StatelessWidget {
  ConfirmationDialog(this.turn);
  final Turn turn;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        "Confirmación",
        style: CustomStyles.kMainTitleStyle,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Desea sacar un turno para ${turn.activity} el ${DateFormat.MMMMEEEEd().format(turn.date)} a las ${DateFormat.Hm().format(turn.date)} en ${turn.court} con duración de ${TimeUtils.getDurationFromIndex(turn.duration)} hora",
            style: CustomStyles.kTitleStyle,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Costo:",
                style: CustomStyles.kSubtitleStyle,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "\$${turn.cost}",
                style: CustomStyles.kTitleStyle,
              ),
            ],
          ),
        ],
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Constants.kCardBorderRadius),
      ),
      actions: [
        FlatButton(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
          child: Text(
            "Cancelar",
            style: CustomStyles.kSubtitleStyle,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        FlatButton(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
          color: CustomColors.kMainColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Constants.kCardBorderRadius),
          ),
          child: Text(
            "Confirmar",
            style: CustomStyles.kSelectionCardStyle.copyWith(
              color: Colors.white,
            ),
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}
