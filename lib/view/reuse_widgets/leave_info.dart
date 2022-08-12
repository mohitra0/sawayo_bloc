import 'package:flutter/material.dart';
import 'package:sawayo/utils/mediaquery.dart';

Widget leaveInfo(Resize _resize, String heading, String title) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text(
        heading,
        style: const TextStyle(
          color: Colors.grey,
        ),
      ),
      SizedBox(
        height: _resize.resposiveConst * 5,
      ),
      Text(
        title,
        style: TextStyle(
            color: Colors.black87, fontSize: _resize.resposiveConst * 12),
      ),
    ],
  );
}
