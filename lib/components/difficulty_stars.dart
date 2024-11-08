import 'package:flutter/material.dart';

Widget difficultyStars(int difficulty) {
  return Row(
    children: List.generate(5, (index) {
      return Icon(
        Icons.star,
        size: 15,
        color: index < difficulty ? Colors.blue : Colors.blue[100],
      );
    }),
  );
}