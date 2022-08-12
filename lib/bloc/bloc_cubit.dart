import 'package:bloc/bloc.dart';
import 'package:sawayo/bloc/state_cubit.dart';

class LeaveCubit extends Cubit<LeaveState> {
  LeaveCubit()
      : super(LeaveState(
          totalLeave: 30,
          usedDays: 0,
        ));

// setting the leave date and other info for the user
  void setDate(totalDays, startDate, endDate) => emit(state.copyWith(
        endDate: endDate,
        totalDays: totalDays,
        startDate: startDate,
      ));

// setting the leave type
  void setType(String type) => emit(state.copyWith(
        selectedType: type,
      ));

// confirming the date for user
  void confirmDate() => emit(LeaveState(
      usedDays: state.usedDays! + state.totalDays!,
      totalLeave: state.totalLeave! - state.totalDays!,
      totalDays: null,
      startDate: null,
      selectedType: null,
      endDate: null));
}
