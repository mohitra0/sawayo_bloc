import 'package:flutter/material.dart';

LinearGradient linearGradient(BuildContext ctx) {
  return const LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    stops: [.3, .6, .9],
    colors: [Colors.amber, Colors.amber, Color.fromARGB(255, 255, 236, 179)],
  );
}

Color backGroundColor = Colors.amber;
