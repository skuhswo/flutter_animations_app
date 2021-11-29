import 'package:flutter/material.dart';

class TimeStopper extends StatefulWidget {
  final AnimationController controller;

  TimeStopper({Key? key, required this.controller}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TimeStopperState(controller);
}

class _TimeStopperState extends State<TimeStopper> {
  final AnimationController _controller;
  static const String startText = "Start Animation";
  static const String stopText = "Stop Animation";

  static const Color startColor = Colors.green;
  static const Color stopColor = Colors.red;

  String timeStopperText = stopText;
  Color timeStopperColor = stopColor;

  _TimeStopperState(this._controller);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTimeStopperTapped,
      child: Container(
        decoration: BoxDecoration(color: timeStopperColor),
        width: 160,
        height: 40,
        child: Align(child: Text(timeStopperText)),
      ),
    );
  }

  void onTimeStopperTapped() {
    if (_controller.isAnimating) {
      _controller.stop();
      setState(() {
        timeStopperText = startText;
        timeStopperColor = startColor;
      });
    } else {
      _controller.repeat();
      setState(() {
        timeStopperText = stopText;
        timeStopperColor = stopColor;
      });
    }
  }
}
