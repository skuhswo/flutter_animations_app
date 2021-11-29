import 'package:flutter/material.dart';

class AnimationItem {
  String _title;
  String _subtitle;
  Widget _page;

  AnimationItem(this._title, this._subtitle, this._page);

  String get title => _title;
  String get subtitle => _subtitle;
  Widget get page => _page;
}