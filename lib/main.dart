import 'package:flutter/material.dart';
import 'package:flutter_animations_app/page/main_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static final String title = 'Flutter Animations';

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: ThemeData(
          primaryColor: Colors.blueGrey[900],
        ),
        home: MainPage(),
      );
}
