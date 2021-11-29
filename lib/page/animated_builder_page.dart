import 'package:flutter/material.dart';
import 'package:flutter_animations_app/clipper/custom_shape_clipper.dart';

class AnimatedBuilderPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AnimatedBuilderPageState();
}

class _AnimatedBuilderPageState extends State<AnimatedBuilderPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animation;

  @override
  void initState() {
    super.initState();
    _animation = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _animation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Animated Builder"),
        ),
        backgroundColor: Colors.black87,
        body: Container(
            child: Stack(
          children: <Widget>[
            AnimatedBuilder(
                animation: _animation,
                builder: (_, __) {
                  return ClipPath(
                    clipper: const CustomShapeClipper(),
                    child: Container(
                        height: 200,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [Colors.cyanAccent, Colors.yellow],
                                stops: [0, _animation.value]))),
                  );
                }),
            ClipPath(
              clipper: const CustomShapeClipper(),
              child: Container(
                height: 150,
                color: Colors.black,
              ),
            )
          ],
        )));
  }
}
