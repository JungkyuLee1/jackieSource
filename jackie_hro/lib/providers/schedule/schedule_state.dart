import 'package:equatable/equatable.dart';
import 'package:jackie_hr/models/customer_error.dart';

import '../../models/schedule_model.dart';

enum ScheduleStatus { initial, loading, loaded, error }

class ScheduleState extends Equatable {
  final ScheduleStatus scheduleStatus;
  final List<ScheduleModel> schedules;
  final CustomError? customError;

  ScheduleState(
      {required this.scheduleStatus, required this.schedules, this.customError});

  factory ScheduleState.initial() {
    return ScheduleState(
        scheduleStatus: ScheduleStatus.initial,
        schedules: [],
        customError: CustomError());
  }

  ScheduleState copyWith(
      {ScheduleStatus? scheduleStatus,
      List<ScheduleModel>? schedules,
      CustomError? customError}) {
    return ScheduleState(
        scheduleStatus: scheduleStatus ?? this.scheduleStatus,
        schedules: schedules ?? this.schedules,
        customError: customError ?? this.customError);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [scheduleStatus, schedules, customError];

  @override
  // TODO: implement stringify
  bool? get stringify => true;
}
