import 'package:flutter/material.dart';
import 'package:flutter_animations_app/widget/time_stopper.dart';

class RotationTransitionPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RotationTransitionPageState();
}

class _RotationTransitionPageState extends State<RotationTransitionPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(duration: Duration(seconds: 15), vsync: this)
          ..repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Rotation Transition"),
      ),
      backgroundColor: Colors.black87,
      body: Center(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          SizedBox(height: 36),
          RotationTransition(
            alignment: Alignment.center,
            child: Image.asset("images/Base.png", height: 200, width: 200),
            turns: _animationController,
          ),
          SizedBox(height: 36),
          TimeStopper(controller: _animationController),
        ]),
      )


    );
  }
}
