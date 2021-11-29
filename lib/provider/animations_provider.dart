import 'package:flutter_animations_app/model/animation_item.dart';
import 'package:flutter_animations_app/page/bones_page.dart';
import 'package:flutter_animations_app/page/custom_rive_animation_page.dart';
import 'package:flutter_animations_app/page/animated_container_page.dart';
import 'package:flutter_animations_app/page/animated_builder_page.dart';
import 'package:flutter_animations_app/page/color_tween_page.dart';
import 'package:flutter_animations_app/page/rotation_transition_page.dart';

class AnimationsProvider {
  Map<String, AnimationItem> _items = new Map();

  AnimationsProvider() {
    _items = {
      "0": AnimationItem(
          "Animated Container", "Implicitly animated build-in widget", AnimatedContainerPage()),
      "1": AnimationItem(
          "Color Tween", "TweenAnimationBuilder", ColorTweenPage()),
      "2": AnimationItem("Rotation Transition", "Explicitly animated build-in widget", RotationTransitionPage()),
      "3": AnimationItem("Animated Builder", "AnimatedBuilder", AnimatedBuilderPage()),
      "4": AnimationItem("Custom Rive Animation", "Animation Framework (Rive)", CustomRiveAnimationPage()),
      "5": AnimationItem("Bones", "Animation Framework (Rive)", BonesPage()),
    };
  }

  Map<String, AnimationItem> get items => _items;
}
