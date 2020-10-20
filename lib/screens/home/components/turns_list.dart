import 'package:delicias_turns_app/models/turn.dart';
import 'package:delicias_turns_app/providers/turns_provider.dart';
import 'package:delicias_turns_app/screens/turn_detail/turn_detail_screen.dart';
import 'package:delicias_turns_app/utils/constants.dart';
import 'package:delicias_turns_app/utils/custom_colors.dart';
import 'package:delicias_turns_app/utils/custom_styles.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class TurnsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "  Mis reservas",
          style: CustomStyles.kSubtitleStyle,
        ),
        SizedBox(
          height: 10,
        ),
        Expanded(
          child: Consumer<TurnsProvider>(
            builder: (context, turnsData, _) {
              return FutureBuilder<List<Turn>>(
                future: turnsData.turns,
                builder: (context, snapshot) {
                  if (snapshot.data != null) {
                    if (snapshot.data.isEmpty) {
                      return Center(
                        child: Text(
                          "No tienes reservas",
                          style: CustomStyles.kSubtitleStyle,
                        ),
                      );
                    }
                    return ListView.builder(
                      itemBuilder: (context, index) =>
                          TurnsListItem(snapshot.data[index]),
                      itemCount: snapshot.data.length,
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              );
            },
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
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(TurnDetailScreen.routeName, arguments: _turn);
      },
      child: Card(
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
      ),
    );
  }
}
