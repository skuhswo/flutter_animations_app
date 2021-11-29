import 'package:flutter/material.dart';
import 'package:flutter_animations_app/page/animated_container_page.dart';

abstract class ToggleButtonOption {
  String _title;
  bool isSelected;

  ToggleButtonOption(this._title, this.isSelected);

  String get title => _title;

  void setProperties(AnimatedContainerPageState firstAnimationPageState);
}

class ToggleButtonOptionColor extends ToggleButtonOption {
  Color _color;

  ToggleButtonOptionColor(String title, bool isSelected, this._color)
      : super(title, isSelected);

  @override
  void setProperties(AnimatedContainerPageState firstAnimationPageState) {
    firstAnimationPageState.color = _color;
  }
}

class ToggleButtonOptionCurve extends ToggleButtonOption {
  Curve _curve;

  ToggleButtonOptionCurve(String title, bool isSelected, this._curve)
      : super(title, isSelected);

  @override
  void setProperties(AnimatedContainerPageState firstAnimationPageState) {
    firstAnimationPageState.curve = _curve;
  }
}
