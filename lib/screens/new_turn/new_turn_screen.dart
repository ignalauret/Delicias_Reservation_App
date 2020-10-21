import 'package:delicias_turns_app/screens/new_turn/components/date_selection.dart';
import 'package:delicias_turns_app/screens/new_turn/components/duration_selection.dart';
import 'package:delicias_turns_app/utils/custom_colors.dart';
import 'package:delicias_turns_app/utils/custom_styles.dart';
import 'package:flutter/material.dart';

class NewTurnScreen extends StatefulWidget {
  static const routeName = "/new-turn";
  @override
  _NewTurnScreenState createState() => _NewTurnScreenState();
}

class _NewTurnScreenState extends State<NewTurnScreen> {
  int selectedDate = 0;
  int selectedDuration = 1;

  void selectDate(int index) {
    setState(() {
      selectedDate = index;
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
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
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
              TurnSelection(selectedDate, DateTime.now(), selectDate),
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
            ],
          ),
        ),
      ),
    );
  }
}
