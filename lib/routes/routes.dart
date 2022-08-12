import 'package:flutter/material.dart';
import 'package:sawayo/view/screen2.dart';
import 'package:sawayo/view/screen3.dart';

final Map<String, WidgetBuilder> routes = {
  '/screen2': (ctx) => const Screen2(),
  '/screen3': (ctx) => const Screen3(),
};
