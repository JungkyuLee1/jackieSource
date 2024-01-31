import 'package:equatable/equatable.dart';

class DevOngoingCountState extends Equatable{
  final int count;
  DevOngoingCountState({required this.count});

  DevOngoingCountState copyWith({int? count}){
    return DevOngoingCountState(count: count ?? this.count);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [count];

  @override
  // TODO: implement stringify
  bool? get stringify => true;



}