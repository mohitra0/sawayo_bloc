import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sawayo/bloc/bloc_cubit.dart';
import 'package:sawayo/bloc/state_cubit.dart';
import 'package:sawayo/utils/clippath.dart';
import 'package:sawayo/utils/colors.dart';
import 'package:sawayo/utils/const.dart';
import 'package:sawayo/utils/mediaquery.dart';
import 'package:sawayo/utils/snackbar.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class Screen3 extends StatefulWidget {
  const Screen3({Key? key}) : super(key: key);

  @override
  Screen3State createState() => Screen3State();
}

class Screen3State extends State<Screen3> {
  String startDate = '';
  String endDate = '';
  int? rangeCount = 1;
  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    if (args.value is PickerDateRange) {
      startDate = DateFormat('dd-MMMM-yyyy').format(args.value.startDate);
      endDate = DateFormat('dd-MMMM-yyyy')
          .format(args.value.endDate ?? args.value.startDate);
    }
    if (args.value.endDate != null) {
      rangeCount =
          args.value.endDate.difference(args.value.startDate).inDays + 1;
    }
  }

  final Resize _resize = Resize();
  DateRangePickerController controller = DateRangePickerController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      body: BlocBuilder<LeaveCubit, LeaveState>(builder: (context, state) {
        return SafeArea(
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Container(
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
                        SfDateRangePicker(
                          initialSelectedDate: null,
                          controller: controller,
                          selectionColor: Colors.amber,
                          rangeSelectionColor: Colors.amber.withOpacity(0.2),
                          startRangeSelectionColor: Colors.amber,
                          endRangeSelectionColor: Colors.amber,
                          allowViewNavigation: true,
                          onSelectionChanged: _onSelectionChanged,
                          selectionMode: DateRangePickerSelectionMode.range,
                        ),
                        const Spacer(),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                                alignment: Alignment.center,
                                width: _resize.width * 0.37,
                                height: _resize.resposiveConst * 55,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(18),
                                    border: Border.all(color: Colors.black)),
                                child: Text(
                                  'back',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      fontSize: _resize.resposiveConst * 20),
                                ),
                              ),
                            ),
                            const Spacer(),
                            GestureDetector(
                              onTap: () {
                                if (state.usedDays! + rangeCount! > 30) {
                                  showSnackBarRed(
                                      'Not enough leave left', context);
                                } else if (startDate == '') {
                                  showSnackBarRed(
                                      'Please Select a date', context);
                                } else {
                                  BlocProvider.of<LeaveCubit>(context)
                                      .setDate(rangeCount, startDate, endDate);
                                  Navigator.pop(context);
                                }
                              },
                              child: Container(
                                alignment: Alignment.center,
                                width: _resize.width * 0.37,
                                height: _resize.resposiveConst * 55,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(18),
                                  gradient: linearGradient(context),
                                ),
                                child: Text(
                                  'Select',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: _resize.resposiveConst * 20),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: _resize.resposiveConst * 29,
                ),
                decoration: const BoxDecoration(
                    shape:
                        BoxShape.circle, // BoxShape.circle or BoxShape.retangle
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
              ),
            ],
          ),
        );
      }),
    );
  }
}
