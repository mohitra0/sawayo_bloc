import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sawayo/utils/mediaquery.dart';
import '../../bloc/bloc_cubit.dart';

Widget infoBoxes(Resize _resize, state, BuildContext context, String heading) {
  return GestureDetector(
    onTap: () {
      BlocProvider.of<LeaveCubit>(context).setType(heading);
    },
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: state.selectedType == heading
            ? Colors.amber
            : Colors.grey.withOpacity(0.3),
      ),
      height: _resize.resposiveConst * 100,
      width: _resize.width * 0.39,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Spacer(flex: 2),
          Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(100)),
            child: const Icon(
              Icons.sunny,
              color: Colors.amber,
            ),
          ),
          const Spacer(flex: 1),
          Text(
            heading,
            style: const TextStyle(color: Colors.black54),
          ),
          const Spacer(flex: 2),
        ],
      ),
    ),
  );
}
