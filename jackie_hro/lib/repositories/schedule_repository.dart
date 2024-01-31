import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jackie_hr/models/customer_error.dart';

import '../constants/db_constants.dart';
import '../models/schedule_model.dart';

class ScheduleRepository {
  //Add new schedule
  Future<String> addSchedule(ScheduleModel newSchedule) async {
    try {
      DocumentReference<Map<String, dynamic>> docRef = await scheduleRef
          .doc(newSchedule.userAccount)
          .collection('userSchedule')
          .add({
        'title': newSchedule.title,
        'desc': newSchedule.desc,
        'imageUrl': newSchedule.imageUrl,
        'videoUrl': newSchedule.videoUrl,
        'completeStatus': newSchedule.completeStatus,
        'devStep': newSchedule.devStep,
        'inputPassword': newSchedule.inputPassword,
        'nation': newSchedule.nation,
        'userAccount': newSchedule.userAccount,
        'createDate': newSchedule.createDate,
        'updateDate': newSchedule.updateDate,
      });

      return docRef.id;
    } catch (e) {
      throw CustomError(
          code: 'Add Exception',
          message: e.toString(),
          plugin: '/flutter-error/server-error');
    }
  }

  //update schedule
  Future<void> updateSchedule(ScheduleModel schedule) async {
    try {
      await scheduleRef
          .doc(schedule.userAccount)
          .collection('userSchedule')
          .doc(schedule.id)
          .update({
        'title': schedule.title,
        'desc': schedule.desc,
        'imageUrl': schedule.imageUrl,
        'videoUrl': schedule.videoUrl,
        'completeStatus': schedule.completeStatus,
        'devStep': schedule.devStep,
        'inputPassword': schedule.inputPassword,
        'nation': schedule.nation,
        'userAccount': schedule.userAccount,
        'createDate': schedule.createDate,
        'updateDate': schedule.updateDate,
      });
    } catch (e) {
      throw CustomError(
          code: 'Update Exception',
          message: e.toString(),
          plugin: '/flutter-error/server-err');
    }
  }

  //View All Schedule
  Future<List<ScheduleModel>> allSchedule(
      String userAccount, String completeStatus, String? searchTerm) async {
    try {
      QuerySnapshot<Map<String, dynamic>> snapshots;

      if (completeStatus == 'all') {
        //all
        snapshots = await scheduleRef
            .doc(userAccount)
            .collection('userSchedule')
            .orderBy('createDate', descending: true)
            .get();
      } else {
        snapshots = await scheduleRef
            .doc(userAccount)
            .collection('userSchedule')
            .where('completeStatus', isEqualTo: completeStatus)
            .orderBy('createDate', descending: true)
            .get();
      }
      final schedules =
          snapshots.docs.map((doc) => ScheduleModel.fromDoc(doc)).toList();
      //검색어 미 입력 시
      if (searchTerm == null) {
        return schedules;
      } else {
        return schedules
            .where((ScheduleModel schedule) =>
                schedule.title.toLowerCase().contains(searchTerm.toLowerCase()))
            .toList();
      }
    } catch (e) {
      throw CustomError(
          code: 'View Exception',
          message: e.toString(),
          plugin: '/flutter-error/server-error');
    }
  }

  //Delete
  Future<void> removeSchedule(ScheduleModel schedule) async {
    try {
      await scheduleRef
          .doc(schedule.userAccount)
          .collection('userSchedule')
          .doc(schedule.id)
          .delete();
    } catch (e) {
      throw CustomError(
          code: 'Delete Exception',
          message: e.toString(),
          plugin: '/flutter-error/server-error');
    }
  }
}
