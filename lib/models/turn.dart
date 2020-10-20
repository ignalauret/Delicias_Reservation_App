import 'package:flutter/material.dart';

enum Activity { Tennis, Paddle }

class Turn {
  String id;
  final String uid;
  final DateTime date;
  final int duration;
  final Activity activity;
  final String court;
  bool withLight;
  int cost;

  Turn({
    @required this.uid,
    @required this.date,
    @required this.duration,
    @required this.activity,
    @required this.court,
  });
}
