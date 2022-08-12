import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sawayo/bloc/bloc_cubit.dart';
import 'package:sawayo/bloc/state_cubit.dart';
import 'package:sawayo/utils/clippath.dart';
import 'package:sawayo/utils/colors.dart';
import 'package:sawayo/utils/mediaquery.dart';
import 'package:sawayo/utils/snackbar.dart';
import 'package:sawayo/view/reuse_widgets/info_boxes.dart';
import 'package:sawayo/view/reuse_widgets/profile_image.dart';

class Screen2 extends StatefulWidget {
  const Screen2({Key? key}) : super(key: key);

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  final Resize _resize = Resize();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      body: SafeArea(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            BlocBuilder<LeaveCubit, LeaveState>(builder: (context, state) {
              return Container(
                margin: EdgeInsets.only(
                  top: _resize.resposiveConst * 100,
                ),
                child: ClipPath(
                  clipper: CurveClipperBigBox(),
                  child: Container(
                    height: _resize.height * 0.8,
                    margin: EdgeInsets.symmetric(
                        horizontal: _resize.resposiveConst * 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.white.withOpacity(0.95),
                    ),
                    padding: EdgeInsets.symmetric(
                        horizontal: _resize.resposiveConst * 20,
                        vertical: _resize.resposiveConst * 40),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: _resize.height * 0.02),
                        Text(
                          'New Request',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: _resize.resposiveConst * 25),
                        ),
                        SizedBox(height: _resize.height * 0.04),
                        Row(
                          children: [
                            infoBoxes(_resize, state, context, 'Annual'),
                            const SizedBox(width: 2),
                            infoBoxes(_resize, state, context, 'Parential'),
                          ],
                        ),
                        const SizedBox(height: 2),
                        Row(
                          children: [
                            infoBoxes(_resize, state, context, 'Unpaid'),
                            const SizedBox(width: 2),
                            infoBoxes(_resize, state, context, 'Special'),
                          ],
                        ),
                        SizedBox(height: _resize.height * 0.05),
                        state.startDate != null
                            ? GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pushNamed('/screen3');
                                },
                                child: Container(
                                  color: Colors.white,
                                  width: double.infinity,
                                  child: Column(
                                    children: [
                                      Container(
                                          alignment: Alignment.topLeft,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: Text(
                                            state.startDate.toString(),
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize:
                                                    _resize.resposiveConst *
                                                        16),
                                          )),
                                      const Divider(
                                        thickness: 1,
                                        color: Colors.black,
                                      ),
                                      Container(
                                        alignment: Alignment.topLeft,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: Text(
                                          state.endDate.toString(),
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize:
                                                  _resize.resposiveConst * 16),
                                        ),
                                      ),
                                      const Divider(
                                        thickness: 1,
                                        color: Colors.black,
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            : GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pushNamed('/screen3');
                                },
                                child: Container(
                                  color: Colors.white,
                                  width: double.infinity,
                                  child: Column(
                                    children: [
                                      Container(
                                          alignment: Alignment.topLeft,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: Text(
                                            'From',
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize:
                                                    _resize.resposiveConst *
                                                        16),
                                          )),
                                      SizedBox(height: _resize.height * 0.006),
                                      const Divider(
                                        thickness: 1,
                                      ),
                                      SizedBox(height: _resize.height * 0.02),
                                      Container(
                                        alignment: Alignment.topLeft,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: Text(
                                          'To',
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize:
                                                  _resize.resposiveConst * 16),
                                        ),
                                      ),
                                      SizedBox(height: _resize.height * 0.006),
                                      const Divider(
                                        thickness: 1,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            if (state.selectedType == null ||
                                state.totalDays == null) {
                              showSnackBarRed(
                                  'Please fill all Fields', context);
                            } else {
                              BlocProvider.of<LeaveCubit>(context)
                                  .confirmDate();
                              showSnackBarGreen(
                                  'Leave has been Applied', context);
                              Navigator.pop(context);
                            }
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: _resize.width * 0.9,
                            height: _resize.resposiveConst * 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(18),
                              gradient: linearGradient(context),
                            ),
                            child: Text(
                              'Confirm',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: _resize.resposiveConst * 20),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            }),
            profileImage(_resize)
          ],
        ),
      ),
    );
  }
}
