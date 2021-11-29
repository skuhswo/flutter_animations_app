import 'package:vector_math/vector_math.dart' as Math;
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';

class CustomRiveAnimationPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CustomRiveAnimationPageState();
}

class _CustomRiveAnimationPageState extends State<CustomRiveAnimationPage> {
  SMIInput<double>? _degreesInput;
  SMIInput<bool>? _isSelectableMenuItemInput;
  Artboard? _riveArtBoard;
  double _prevAngle = 0;

  @override
  void initState() {
    super.initState();

    rootBundle.load('assets/menu.riv').then(
      (data) async {
        final file = RiveFile.import(data);
        final artBoard = file.mainArtboard;
        var controller =
            StateMachineController.fromArtboard(artBoard, 'rotate_animation');
        if (controller != null) {
          artBoard.addController(controller);

          controller.inputs.forEach((element) {
            if (element.name == "Degrees") {
              _degreesInput = element as SMIInput<double>?;
            }
            if (element.name == "IsSelectableMenuItem") {
              _isSelectableMenuItemInput = element as SMIInput<bool>?;
            }
          });
        }
        setState(() => _riveArtBoard = artBoard);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Custom Rive Animation"),
        ),
        backgroundColor: Colors.black87,
        body: Center(
          child: _riveArtBoard == null
              ? const SizedBox()
              : MouseRegion(
                  child: GestureDetector(
                    onPanStart: (startDetails) {
                      onMenuItemStartDrag(startDetails.localPosition);
                    },
                    onPanUpdate: (update) {
                      onMenuItemDrag(update.localPosition);
                    },
                    onPanEnd: (details) {
                      onMenuItemDragEnd();
                    },
                    child: SizedBox(
                      width: 300,
                      height: 300,
                      child: Rive(
                        artboard: _riveArtBoard!,
                      ),
                    ),
                  ),
                ),
        ));
  }

  void onMenuItemDragEnd() {
    setState(() {
      _prevAngle = _degreesInput?.value ?? 0;
      _isSelectableMenuItemInput?.value = false;
    });
  }

  void onMenuItemStartDrag(Offset dragPosition) {
    updateIsSelectableMenuItem(dragPosition);
  }

  void onMenuItemDrag(Offset dragPosition) {
    if(_isSelectableMenuItemInput?.value != null && !_isSelectableMenuItemInput!.value) return;

    var angle = calculateAngleTouchPosAndSelectedItem(dragPosition);
    setState(() {

      var newAngle = (angle + _prevAngle) % 360;
      _degreesInput?.value = newAngle;
    });
  }

  void updateIsSelectableMenuItem(Offset dragPosition) {
    setState(() {
      if (dragPosition.dx > 15 &&
          dragPosition.dx <= 75 &&
          dragPosition.dy >= 120 &&
          dragPosition.dy <= 185) {

        _isSelectableMenuItemInput?.value = true;
      } else {
        _isSelectableMenuItemInput?.value = false;
      }
    });
  }

  double calculateAngleTouchPosAndSelectedItem(Offset touchPosition) {
    var touchPos = Math.Vector2(touchPosition.dx, touchPosition.dy);
    var gameObjectPosition = Math.Vector2(0, 150);
    var menuCenterPoint = Math.Vector2(150.0, 150.0);
    var vectorTouchPosition = touchPos - menuCenterPoint;
    var vectorGameObject = gameObjectPosition - menuCenterPoint;

    return calculateAngleInDegrees(vectorTouchPosition, vectorGameObject);
  }

  double calculateAngleInDegrees(Math.Vector2 a, Math.Vector2 b) {
    var angle = -Math.degrees(atan2(a.y, a.x) - atan2(b.y, b.x));
    return 360 - angle;
  }
}
