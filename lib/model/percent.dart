import 'package:flutter/material.dart';

class Percentage {
  final String text;
  double percent;

  Percentage({required this.text, required this.percent});
}

final PercentageList = [
  Percentage(text: "Sugar", percent: 20),
  Percentage(text: "Bubbles", percent: 50),
  Percentage(text: "Ice", percent: 35),
];
