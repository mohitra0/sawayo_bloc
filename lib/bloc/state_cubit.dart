class LeaveState {
  num? totalLeave;
  num? totalDays;
  String? startDate;
  String? endDate;
  String? dateType;
  String? selectedType;
  num? usedDays;

  LeaveState(
      {this.totalLeave,
      this.startDate,
      this.endDate,
      this.dateType,
      this.selectedType,
      this.totalDays,
      this.usedDays});
  LeaveState copyWith({
    num? totalLeave,
    num? totalDays,
    String? startDate,
    String? endDate,
    String? dateType,
    String? selectedType,
    num? usedDays,
  }) {
    return LeaveState(
      totalLeave: totalLeave ?? this.totalLeave,
      totalDays: totalDays ?? this.totalDays,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      dateType: dateType ?? this.dateType,
      usedDays: usedDays ?? this.usedDays,
      selectedType: selectedType ?? this.selectedType,
    );
  }
}
