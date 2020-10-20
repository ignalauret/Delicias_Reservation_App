import 'package:delicias_turns_app/models/turn.dart';
import 'package:flutter/material.dart';

class TurnsProvider extends ChangeNotifier {
  List<Turn> _turns;

  Future<List<Turn>> get turns async {
    if (_turns == null) _turns = await fetchTurns();
    return _turns;
  }

  Future<List<Turn>> fetchTurns() async {
    // Simulates http latency.
    await Future.delayed(Duration(seconds: 2));
    return [
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
  }
}
