import 'package:flutter/material.dart';

class CustomShapeClipper extends CustomClipper<Path> {
  const CustomShapeClipper();

  @override
  getClip(Size size) {
    var path = new Path();
    path.lineTo(0, 0);

    var firstStart = Offset(size.width / 5, size.height);
    var firstEnd = Offset(size.width / 3, size.height/3);
    path.quadraticBezierTo(
        firstStart.dx, firstStart.dy, firstEnd.dx, firstEnd.dy);

    path.lineTo(size.width/2, size.height/3);
    path.lineTo((size.width/3)*2, size.height*0.8);

    path.lineTo(
        size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) => false;
}