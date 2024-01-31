import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class ScheduleModel extends Equatable {
  final String? id;
  final String title;
  final String desc;
  final String imageUrl;
  final String videoUrl;
  final String completeStatus;
  final int devStep;
  final String inputPassword;
  final String nation;
  final String userAccount;
  final Timestamp createDate;
  final Timestamp updateDate;

  ScheduleModel({
    this.id,
    required this.title,
    required this.desc,
    required this.imageUrl,
    required this.videoUrl,
    required this.completeStatus,
    required this.devStep,
    required this.inputPassword,
    required this.nation,
    required this.userAccount,
    required this.createDate,
    required this.updateDate,
  });

  factory ScheduleModel.initial() {
    return ScheduleModel(
        id: '',
        title: '',
        desc: '',
        imageUrl: '',
        videoUrl: '',
        completeStatus: 'ongoing',
        devStep: 1,
        inputPassword: '0000',
        nation: 'ALL',
        userAccount: '',
        createDate: Timestamp.fromDate(DateTime.now()),
        updateDate: Timestamp.fromDate(DateTime.now()));
  }

  factory ScheduleModel.fromDoc(DocumentSnapshot scheduleDoc) {
    final scheduleData = scheduleDoc.data() as Map<String, dynamic>;

    return ScheduleModel(
        id: scheduleDoc.id,
        title: scheduleData['title'],
        desc: scheduleData['desc'],
        imageUrl: scheduleData['imageUrl'],
        videoUrl: scheduleData['videoUrl'],
        completeStatus: scheduleData['completeStatus'],
        devStep: scheduleData['devStep'],
        inputPassword: scheduleData['inputPassword'],
        nation: scheduleData['nation'],
        userAccount: scheduleData['userAccount'],
        createDate: scheduleData['createDate'],
        updateDate: scheduleData['updateDate']);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        title,
        desc,
        imageUrl,
        videoUrl,
        completeStatus,
        devStep,
        inputPassword,
        nation,
        userAccount,
        createDate,
        updateDate,
      ];

  @override
  // TODO: implement stringify
  bool? get stringify => true;
}

enum Filter { All, Ongoing, Completed }
