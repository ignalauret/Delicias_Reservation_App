import 'package:delicias_turns_app/components/danger_button.dart';
import 'package:delicias_turns_app/models/turn.dart';
import 'package:delicias_turns_app/utils/custom_colors.dart';
import 'package:delicias_turns_app/utils/custom_styles.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TurnDetailScreen extends StatelessWidget {
  static const routeName = "/detail";

  Widget _buildInfoRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: CustomStyles.kSubtitleStyle,
        ),
        Text(
          value,
          style: CustomStyles.kTitleStyle,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final Turn _turn = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: CustomColors.kGreyColor,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          FlatButton(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Descargar",
                  style: CustomStyles.kAppBarTitle,
                ),
                SizedBox(
                  width: 5,
                ),
                Icon(
                  Icons.file_download,
                  size: 20,
                  color: CustomColors.kGreyColor,
                ),
              ],
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(
            vertical: 0,
            horizontal: 20,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Detalle",
                style: CustomStyles.kMainTitleStyle,
              ),
              _buildInfoRow("Actividad", _turn.activity.toString()),
              _buildInfoRow("Cancha", _turn.court),
              _buildInfoRow("Fecha", DateFormat.MMMMEEEEd().format(_turn.date)),
              _buildInfoRow("Horario", DateFormat.Hm().format(_turn.date)),
              _buildInfoRow("Duración", _turn.duration.toString()),
              _buildInfoRow("Luz", _turn.withLight ? "Si" : "No"),
              _buildInfoRow("Costo", "\$${_turn.cost}"),
              DangerButton(
                label: "Cancelar Reserva",
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
