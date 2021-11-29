import 'package:flutter/material.dart';
import 'package:flutter_animations_app/model/color_dropdown_menu_item.dart';
import 'package:flutter_animations_app/widget/color_tween_animation_widget.dart';

class ColorTweenPage extends StatefulWidget {
  @override
  _ColorTweenPageState createState() => _ColorTweenPageState();
}

class _ColorTweenPageState extends State<ColorTweenPage> {
  static List<ColorDropdownMenuItem> dropdownMenuItems() => [
        ColorDropdownMenuItem("White", Colors.white),
        ColorDropdownMenuItem("Cyan", Colors.cyan),
        ColorDropdownMenuItem("Red", Colors.red),
        ColorDropdownMenuItem("Pink", Colors.pink),
        ColorDropdownMenuItem("Yellow", Colors.yellow)
      ];

  ColorTweenAnimationWidget _colorTweenAnimationWidget =
      ColorTweenAnimationWidget();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Color Tween"),
      ),
      backgroundColor: Colors.black87,
      body: ListView(children: [
        SizedBox(height: 32),
        Center(child: _colorTweenAnimationWidget),
        SizedBox(height: 16),
        Center(
          child: DropdownButton<ColorDropdownMenuItem>(
            hint: Text(
              "Animate to color: ",
              textAlign: TextAlign.end,
              style: TextStyle(color: Colors.grey),
            ),
            items: dropdownMenuItems().map(buildMenuItem).toList(),
            onChanged: (value) => {onDropDownStartColorChanged(value)},
          ),
        )
      ]),
    );
  }

  void onDropDownStartColorChanged(ColorDropdownMenuItem? menuItem) {
    if (menuItem != null) {
      _colorTweenAnimationWidget.changeColors(menuItem.color);
    }
  }

  DropdownMenuItem<ColorDropdownMenuItem> buildMenuItem(
          ColorDropdownMenuItem item) =>
      DropdownMenuItem(
        value: item,
        child: Text(item.title),
      );
}
