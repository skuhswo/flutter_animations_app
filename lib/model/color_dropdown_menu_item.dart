import 'package:flutter/material.dart';

class ColorDropdownMenuItem {
  String _title;
  Color _color;

  ColorDropdownMenuItem(this._title, this._color);

  String get title => _title;
  Color get color => _color;
}
