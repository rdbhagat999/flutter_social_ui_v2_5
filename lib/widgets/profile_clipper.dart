import 'package:flutter/material.dart';

class ProfileClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    double startEndHeight = size.height * 4 / 6;

    path.lineTo(0, startEndHeight);

    Offset toCenter = Offset(size.width / 2, size.height);
    Offset fromCenter = Offset(size.width, startEndHeight);

    path.quadraticBezierTo(
        toCenter.dx, toCenter.dy, fromCenter.dx, fromCenter.dy);

    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
