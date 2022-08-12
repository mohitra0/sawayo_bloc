import 'package:flutter/material.dart';

// this is the clippath for the larger box in screen1.dart

class CurveClipperSmallBox extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path()
      ..moveTo(size.width * 0.7278599, 0)
      ..lineTo(size.width, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..lineTo(0, 0)
      ..lineTo(size.width * 0.2721390, 0)
      ..cubicTo(
          size.width * 0.3025714,
          0,
          size.width * 0.3324121,
          size.height * 0.01533405,
          size.width * 0.3583516,
          size.height * 0.04430320)
      ..lineTo(size.width * 0.4137885, size.height * 0.1062175)
      ..cubicTo(
          size.width * 0.4666813,
          size.height * 0.1652885,
          size.width * 0.5333187,
          size.height * 0.1652885,
          size.width * 0.5762115,
          size.height * 0.1062175)
      ..lineTo(size.width * 0.6416484, size.height * 0.04430315)
      ..cubicTo(size.width * 0.6675879, size.height * 0.01533400,
          size.width * 0.6974286, 0, size.width * 0.7278599, 0)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

// this is the clippath for the larger box in screen2.dart

class CurveClipperBigBox extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path()
      ..moveTo(size.width, 0)
      ..lineTo(size.width * 0.7278599, 0)
      ..cubicTo(
          size.width * 0.6974286,
          0,
          size.width * 0.6675879,
          size.height * 0.004477080,
          size.width * 0.6416484,
          size.height * 0.01293523)
      ..lineTo(size.width * 0.5862115, size.height * 0.03101241)
      ..cubicTo(
          size.width * 0.5333187,
          size.height * 0.04825942,
          size.width * 0.4666813,
          size.height * 0.04825942,
          size.width * 0.4137885,
          size.height * 0.03101241)
      ..lineTo(size.width * 0.3583516, size.height * 0.01293524)
      ..cubicTo(size.width * 0.3324121, size.height * 0.004477095,
          size.width * 0.3025714, 0, size.width * 0.2721390, 0)
      ..lineTo(0, 0)
      ..lineTo(0, size.height)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width, 0)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
