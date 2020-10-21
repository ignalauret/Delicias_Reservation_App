import 'package:delicias_turns_app/components/action_button.dart';
import 'package:delicias_turns_app/models/turn.dart';
import 'package:delicias_turns_app/screens/new_turn/components/confirmation_dialog.dart';
import 'package:delicias_turns_app/screens/new_turn/components/court_selection.dart';
import 'package:delicias_turns_app/screens/new_turn/components/date_selection.dart';
import 'package:delicias_turns_app/screens/new_turn/components/duration_selection.dart';
import 'package:delicias_turns_app/screens/new_turn/components/hour_selection.dart';
import 'package:delicias_turns_app/utils/custom_colors.dart';
import 'package:delicias_turns_app/utils/custom_styles.dart';
import 'package:delicias_turns_app/utils/time_utils.dart';
import 'package:flutter/material.dart';

class NewTurnScreen extends StatefulWidget {
  static const routeName = "/new-turn";
  @override
  _NewTurnScreenState createState() => _NewTurnScreenState();
}

class _NewTurnScreenState extends State<NewTurnScreen> {
  DateTime selectedDate = DateTime.now();
  int selectedDateIndex = 0;
  int selectedDuration = 0;
  int selectedHour = 0;
  int selectedCourt = 0;

  void selectDate(int index, DateTime date) {
    setState(() {
      selectedDateIndex = index;
      selectedDate = date;
    });
  }

  void decreaseDuration() {
    setState(() {
      selectedDuration--;
    });
  }

  void increaseDuration() {
    setState(() {
      selectedDuration++;
    });
  }

  void selectHour(int index) {
    setState(() {
      selectedHour = index;
    });
  }

  void selectCourt(int index) {
    setState(() {
      selectedCourt = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Nueva reserva",
          style: CustomStyles.kAppBarTitle,
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: CustomColors.kGreyColor,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "  Fecha",
                        style: CustomStyles.kTitleStyle,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TurnSelection(
                          selectedDateIndex, DateTime.now(), selectDate),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "  Duración",
                        style: CustomStyles.kTitleStyle,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      DurationSelection(
                        selectedDuration: selectedDuration,
                        increase: increaseDuration,
                        decrease: decreaseDuration,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "  Horario",
                        style: CustomStyles.kTitleStyle,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      HourSelection(selectedHour, selectHour),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "  Cancha",
                        style: CustomStyles.kTitleStyle,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CourtSelection(selectedCourt, selectCourt),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ActionButton(
                label: "Reservar",
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => ConfirmationDialog(
                      Turn(
                        date: TimeUtils.getDateWithHourIndex(selectedDate, selectedHour),
                        duration: selectedDuration,
                        court: "Cancha $selectedCourt",
                        activity: Activity.Tennis,
                        uid: "0",
                      ),
                    ),
                  );
                },
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
