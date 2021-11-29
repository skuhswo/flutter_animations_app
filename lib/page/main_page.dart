import 'package:flutter/material.dart';
import 'package:flutter_animations_app/model/animation_item.dart';
import 'package:flutter_animations_app/provider/animations_provider.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Main Page"),
        ),
        backgroundColor: Colors.black87,
        body: buildAnimationListViewItems(context));
  }

  Widget buildAnimationListViewItems(BuildContext context) {
    final animationsItems = AnimationsProvider().items.values;
    final listTiles = animationsItems
        .map((e) => buildAnimationListViewItem(e, context))
        .toList();

    return ListView(children: listTiles);
  }

  Widget buildAnimationListViewItem(
          AnimationItem animationItem, BuildContext context) =>
      ListTile(
        title: Text(animationItem.title, style: TextStyle(color: Colors.white),),
        subtitle: Text(animationItem.subtitle, style: TextStyle(color: Colors.grey[200]),),
        trailing: Icon(Icons.arrow_forward_ios, color: Colors.white,),
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => animationItem.page,
          ));
        },
      );
}
