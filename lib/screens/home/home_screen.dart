import 'package:delicias_turns_app/components/action_button.dart';
import 'package:delicias_turns_app/screens/home/components/home_screen_header.dart';
import 'package:delicias_turns_app/screens/home/components/turns_list.dart';
import 'package:delicias_turns_app/screens/turn_detail/turn_detail_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.05, vertical: size.height * 0.03),
          child: Column(
            children: [
              HomeScreenHeader(),
              SizedBox(
                height: 50,
              ),
              Expanded(
                child: TurnsList(),
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  vertical: 5,
                  horizontal: 20,
                ),
                child: ActionButton(
                  label: "Hacer Reserva",
                  onTap: () {

                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
