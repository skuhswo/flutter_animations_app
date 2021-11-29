import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_animations_app/model/toggle_button_option.dart';
import 'package:flutter_animations_app/widget/toggle_button_single_required.dart';

class AnimatedContainerPage extends StatefulWidget {
  @override
  AnimatedContainerPageState createState() => AnimatedContainerPageState();
}

class AnimatedContainerPageState extends State<AnimatedContainerPage> {
  static const int _animationDurationStep = 100;
  int _animationDuration = 500;
  Curve curve = Curves.easeInBack;
  static const double minSize = 50;
  static const double maxSize = 200;

  Color color = Colors.red;
  double width = maxSize;
  double height = maxSize;
  BorderRadius borderRadius = BorderRadius.zero;

  static List<ToggleButtonOption> colorOptions = [
    ToggleButtonOptionColor("Red", true, Colors.red),
    ToggleButtonOptionColor("Cyan", false, Colors.cyan),
    ToggleButtonOptionColor("Yellow", false, Colors.yellow),
  ];

  static List<ToggleButtonOption> curveOptions = [
    ToggleButtonOptionCurve("EaseInBack", true, Curves.easeInBack),
    ToggleButtonOptionCurve("BounceOut", false, Curves.bounceOut),
    ToggleButtonOptionCurve("ElasticIn", false, Curves.elasticIn),
  ];

  ToggleButtonSingleRequired toggleButtonColor =
      new ToggleButtonSingleRequired(colorOptions);
  ToggleButtonSingleRequired toggleButtonCurve =
      new ToggleButtonSingleRequired(curveOptions);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("AnimatedContainer"),
        ),
        backgroundColor: Colors.black87,
        body: Center(
          child: buildAnimatedContainer(),
        ));
  }

  Widget buildAnimatedContainer() => ListView(
        children: [
          Container(
            color: Colors.black.withOpacity(0.1),
            width: maxSize,
            height: maxSize,
            child: Center(
              child: AnimatedContainer(
                duration: Duration(milliseconds: _animationDuration),
                curve: curve,
                width: width,
                height: height,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: borderRadius,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: EdgeInsets.all(8),
            child: Center(
              child: Column(
                children: [
                  Text(
                    "Change Box to Color: ",
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(height: 8),
                  toggleButtonColor,
                  SizedBox(height: 16),
                  Text(
                    "Change Curve: ",
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(height: 8),
                  toggleButtonCurve,
                  SizedBox(height: 16),
                  Text(
                    "Change Animation Duration",
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          onPressed: onMinusAnimationDurationPressed,
                          child: Text("-")),
                      SizedBox(width: 8),
                      Text(
                        _animationDuration.toString() + "ms",
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(width: 8),
                      ElevatedButton(
                          onPressed: onPlusAnimationDurationPressed,
                          child: Text("+")),
                    ],
                  ),
                ],
              ),
            ),
          ),
          ElevatedButton(
              child: Text(
                'Start Animation',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: onStartAnimationTapped),
        ],
      );

  Size generateSize() {
    final random = Random();

    final addMax = maxSize.toInt() - minSize.toInt();
    final width = minSize + random.nextInt(addMax);
    final height = minSize + random.nextInt(addMax);

    return Size(width, height);
  }

  void onStartAnimationTapped() {
    final random = Random();
    final size = generateSize();
    final borderRadius = BorderRadius.circular(random.nextDouble() * 80);

    setState(() {
      toggleButtonColor.setProperties(this);
      toggleButtonCurve.setProperties(this);
      this.width = size.width;
      this.height = size.height;
      this.borderRadius = borderRadius;
    });
  }

  void onMinusAnimationDurationPressed() {
    setState(() {
      if ((_animationDuration - _animationDurationStep) < 0) {
        _animationDuration = 0;
      } else {
        _animationDuration = _animationDuration - _animationDurationStep;
      }
    });
  }

  void onPlusAnimationDurationPressed() {
    setState(() {
      if ((_animationDuration - _animationDurationStep) > 10000) {
        _animationDuration = 10000;
      } else {
        _animationDuration = _animationDuration + _animationDurationStep;
      }
    });
  }
}
