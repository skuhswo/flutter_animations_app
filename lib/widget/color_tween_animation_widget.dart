import 'package:flutter/material.dart';

class ColorTweenAnimationWidget extends StatefulWidget {
  final _ColorTweenAnimationWidgetState _colorTweenAnimationWidgetState =
      _ColorTweenAnimationWidgetState();

  void changeColors(Color color) {
    _colorTweenAnimationWidgetState.changeColors(color);
  }

  @override
  _ColorTweenAnimationWidgetState createState() =>
      _colorTweenAnimationWidgetState;
}

class _ColorTweenAnimationWidgetState extends State<ColorTweenAnimationWidget>
    with TickerProviderStateMixin {
  ColorTween _colorTween = ColorTween(begin: Colors.white, end: Colors.white);

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: _colorTween,
      duration: Duration(seconds: 2),
      builder: (_, Color? color, Widget? widget) {
        return ColorFiltered(
          child: Image.asset(
            'images/Base.png',
            height: 200,
            width: 200,
          ),
          colorFilter: ColorFilter.mode(color != null ? color : Colors.white, BlendMode.modulate),
        );
      },
    );
  }

  void changeColors(Color color) {
    setState(() {
      _colorTween = ColorTween(begin: _colorTween.end, end: color);
    });
  }
}
