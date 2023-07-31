import 'package:flutter/material.dart';

class ScreenBody {
  final Widget? title;
  final Widget body;
  final Color backgroundColor;
  final List<Color> linearColors;

  ScreenBody({
    this.title,
    required this.body,
    this.backgroundColor = Colors.white,
    this.linearColors = const [
      Color(0xff286EDA),
      Color(0xff3A7FE8),
      Color(0xff55A9FF)
    ],
  });
}
