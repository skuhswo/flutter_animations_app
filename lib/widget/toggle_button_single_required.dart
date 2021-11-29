import 'package:flutter/material.dart';
import 'package:flutter_animations_app/model/toggle_button_option.dart';
import 'package:flutter_animations_app/page/animated_container_page.dart';

class ToggleButtonSingleRequired extends StatefulWidget {
  final List<ToggleButtonOption> _options;

  ToggleButtonSingleRequired(this._options);

  @override
  _ToggleButtonSingleRequiredState createState() =>
      _ToggleButtonSingleRequiredState();

  void setProperties(AnimatedContainerPageState firstAnimationPageState) {
    int index = _options.indexWhere((element) => element.isSelected == true);
    return _options[index].setProperties(firstAnimationPageState);
  }
}

class _ToggleButtonSingleRequiredState
    extends State<ToggleButtonSingleRequired> {
  late List<ToggleButtonOption> _options;

  @override
  void initState() {
    super.initState();
    _options = widget._options;
  }

  @override
  Widget build(BuildContext context) => Container(
        color: Colors.grey[900],
        child: ToggleButtons(
          isSelected: (_options.map((e) => e.isSelected).toList()),
          selectedColor: Colors.white,
          color: Colors.black12,
          fillColor: Colors.grey,
          renderBorder: false,
          highlightColor: Colors.orange,
          children: buildToggleButtonOptions(),
          onPressed: (int newIndex) {
            setState(() {
              for (int index = 0; index < _options.length; index++) {
                if (index == newIndex) {
                  _options[index].isSelected = true;
                } else {
                  _options[index].isSelected = false;
                }
              }
            });
          },
        ),
      );

  List<Padding> buildToggleButtonOptions() {
    List<Padding> buttonOptions = new List.empty(growable: true);

    _options.forEach((option) {
      var paddingElement = Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Text(option.title,
            style: TextStyle(fontSize: 18, color: Colors.white)),
      );
      buttonOptions.add(paddingElement);
    });

    return buttonOptions;
  }
}
