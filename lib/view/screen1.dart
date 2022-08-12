import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sawayo/bloc/bloc_cubit.dart';
import 'package:sawayo/bloc/state_cubit.dart';
import 'package:sawayo/utils/clippath.dart';
import 'package:sawayo/utils/colors.dart';
import 'package:sawayo/utils/mediaquery.dart';
import 'package:sawayo/view/reuse_widgets/leave_info.dart';
import 'package:sawayo/view/reuse_widgets/profile_image.dart';

class Screen1 extends StatefulWidget {
  const Screen1({Key? key}) : super(key: key);

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  final Resize _resize = Resize();
  @override
  Widget build(BuildContext context) {
    _resize.setValue(
        context); //initalizing the mediaquery once in the app to reuse them over al the app

    return Scaffold(
      backgroundColor: backGroundColor,
      body: SafeArea(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
              margin: EdgeInsets.only(
                top: _resize.resposiveConst * 100,
              ),
              child: ClipPath(
                clipper: CurveClipperSmallBox(),
                child: Container(
                  height: _resize.height * 0.25,
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Dorothy Boone',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: _resize.resposiveConst * 25),
                              ),
                              SizedBox(
                                height: _resize.resposiveConst * 5,
                              ),
                              const Text(
                                'PHP Developer',
                                style: TextStyle(color: Colors.black54),
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushNamed('/screen2');
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(100)),
                              padding: EdgeInsets.all(
                                _resize.resposiveConst * 17,
                              ),
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                                size: _resize.resposiveConst * 20,
                              ),
                            ),
                          )
                        ],
                      ),
                      const Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          BlocBuilder<LeaveCubit, LeaveState>(
                            builder: (context, state) {
                              return leaveInfo(_resize, 'Available',
                                  '${state.totalLeave.toString()} days');
                            },
                          ),
                          SizedBox(
                              height: _resize.resposiveConst * 45,
                              child: const VerticalDivider(color: Colors.grey)),
                          leaveInfo(_resize, 'Al', '30 days'),
                          SizedBox(
                              height: _resize.resposiveConst * 45,
                              child: const VerticalDivider(color: Colors.grey)),
                          BlocBuilder<LeaveCubit, LeaveState>(
                            builder: (context, state) {
                              return leaveInfo(_resize, 'Used',
                                  '${state.usedDays.toString()} days');
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            profileImage(_resize)
          ],
        ),
      ),
    );
  }
}
