// Flutter imports:
import 'package:flutter/material.dart';

class Parser {
  static Color resolveColor(String color) {
    switch (color) {
      case "green":
        return Colors.green;
      case "red":
        return Colors.red;
      default:
        return Colors.white;
    }
  }
}
