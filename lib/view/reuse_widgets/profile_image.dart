import 'package:flutter/material.dart';
import 'package:sawayo/utils/const.dart';
import 'package:sawayo/utils/mediaquery.dart';

Widget profileImage(Resize _resize) {
  return Container(
    margin: EdgeInsets.only(
      top: _resize.resposiveConst * 30,
    ),
    decoration: const BoxDecoration(
        shape: BoxShape.circle, // BoxShape.circle or BoxShape.retangle
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 5.0,
          ),
        ]),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(100),
      child: Image.network(
        AppConstant.girlImage,
        width: _resize.resposiveConst * 90,
        height: _resize.resposiveConst * 90,
      ),
    ),
  );
}
