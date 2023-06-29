import 'package:flutter/material.dart';

const Color _customColor = Color( 0xFF5C11D4 );

const List<Color> _colorTHemes = [
  _customColor,
  Colors.blue,
  Colors.indigo,
  Colors.teal,
  Colors.green,
  Colors.orange,
  Colors.pink,
  Colors.brown,
];

class AppTheme {

  final int selectedColor;

  AppTheme({
    this.selectedColor = 0 }): 
      assert ( selectedColor >= 0 && selectedColor < _colorTHemes.length  );

  ThemeData theme () {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: _colorTHemes[selectedColor],
    );
  }
}