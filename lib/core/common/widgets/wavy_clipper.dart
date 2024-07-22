import 'package:flutter/material.dart';

class WavyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height * 0.35);
    var firstControlPoint = Offset(size.width / 4, size.height * 0.30);
    var firstEndPoint = Offset(size.width / 2, size.height * 0.35);
    var secondControlPoint = Offset(size.width * 0.75, size.height * 0.40);
    var secondEndPoint = Offset(size.width, size.height * 0.35);

    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
