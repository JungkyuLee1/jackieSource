import 'package:jackie_hr/models/customer_error.dart';
import 'package:jackie_hr/providers/schedule/dev_filter_provider.dart';
import 'package:jackie_hr/providers/schedule/dev_search_provider.dart';
import 'package:jackie_hr/providers/schedule/schedule_state.dart';
import 'package:state_notifier/state_notifier.dart';

import '../../models/schedule_model.dart';
import '../../repositories/schedule_repository.dart';

class ScheduleProvider extends StateNotifier<ScheduleState> with LocatorMixin {
  ScheduleProvider() : super(ScheduleState.initial());

  //초기화
  String? searchTerm;
  Filter filter = Filter.All;

  @override
  void update(Locator watch) {
    searchTerm = watch<DevSearchState>().searchTerm;
    filter = watch<DevFilterState>().filter;
  }

  //create
  Future<void> getAddSchedule(ScheduleModel newSchedule) async {
    state = state.copyWith(scheduleStatus: ScheduleStatus.loading);

    try {
      final docRefId =
          await read<ScheduleRepository>().addSchedule(newSchedule);

      ScheduleModel schedule = ScheduleModel(
        id: docRefId,
        title: newSchedule.title,
        desc: newSchedule.desc,
        imageUrl: newSchedule.imageUrl,
        videoUrl: newSchedule.videoUrl,
        completeStatus: newSchedule.completeStatus,
        devStep: newSchedule.devStep,
        inputPassword: newSchedule.inputPassword,
        nation: newSchedule.nation,
        userAccount: newSchedule.userAccount,
        createDate: newSchedule.createDate,
        updateDate: newSchedule.updateDate,
      );

      state = state.copyWith(
          scheduleStatus: ScheduleStatus.loaded,
          schedules: [schedule, ...state.schedules]);
    } on CustomError catch (e) {
      state =
          state.copyWith(scheduleStatus: ScheduleStatus.error, customError: e);
      rethrow;
    }
  }

  //Update
  Future<void> getUpdateSchedule(ScheduleModel schedule) async {
    state = state.copyWith(scheduleStatus: ScheduleStatus.loading);

    try {
      await read<ScheduleRepository>().updateSchedule(schedule);

      final updSchedules = state.schedules
          .map((sch) => sch.id == schedule.id
              ? ScheduleModel(
                  id: sch.id,
                  title: schedule.title,
                  desc: schedule.desc,
                  imageUrl: schedule.imageUrl,
                  videoUrl: schedule.videoUrl,
                  completeStatus: schedule.completeStatus,
                  devStep: schedule.devStep,
                  inputPassword: schedule.inputPassword,
                  nation: schedule.nation,
                  userAccount: schedule.userAccount,
                  createDate: schedule.createDate,
                  updateDate: schedule.updateDate,
                )
              : sch)
          .toList();

      state = state.copyWith(
          scheduleStatus: ScheduleStatus.loaded, schedules: updSchedules);
    } on CustomError catch (e) {
      state =
          state.copyWith(scheduleStatus: ScheduleStatus.error, customError: e);
      rethrow;
    }
  }

  //View
  Future<void> getAllSchedule({required String userAccount}) async {
    state = state.copyWith(scheduleStatus: ScheduleStatus.loading);

    // //All 경우
    // int completeYN=9;
    // if(filter == Filter.Completed){
    //   completeYN = 0;
    // }else if(filter == Filter.Ongoing){
    //   completeYN = 1;
    // }

    //All 경우
    String completeStatus = 'all';
    if (filter == Filter.Completed) {
      completeStatus = 'completed';
    } else if (filter == Filter.Ongoing) {
      completeStatus = 'ongoing';
    }

    try {
      final allSchedule = await read<ScheduleRepository>()
          .allSchedule(userAccount, completeStatus, searchTerm);

      state = state.copyWith(
          scheduleStatus: ScheduleStatus.loaded, schedules: allSchedule);
    } on CustomError catch (e) {
      state =
          state.copyWith(scheduleStatus: ScheduleStatus.error, customError: e);
      rethrow;
    }
  }

  //Delete
  Future<void> getRemoveSchedule(ScheduleModel schedule) async {
    state = state.copyWith(scheduleStatus: ScheduleStatus.loading);

    try {
      await read<ScheduleRepository>().removeSchedule(schedule);

      final updSchedules =
          state.schedules.where((sch) => sch.id != schedule.id).toList();

      state = state.copyWith(
          scheduleStatus: ScheduleStatus.loaded, schedules: updSchedules);
    } on CustomError catch (e) {
      state =
          state.copyWith(scheduleStatus: ScheduleStatus.error, customError: e);
      rethrow;
    }
  }
}
