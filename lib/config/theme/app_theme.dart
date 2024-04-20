import "package:flutter/material.dart";


List<Color> colors = [
  Colors.red,
  Colors.blue
];


class AppTheme {
  ThemeData theme(){
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: colors[1]
    );
  }
}