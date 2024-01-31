import 'package:equatable/equatable.dart';
import 'package:state_notifier/state_notifier.dart';

import '../../models/schedule_model.dart';

class DevFilterState extends Equatable {
  final Filter filter;

  DevFilterState({required this.filter});

  DevFilterState copyWith({Filter? filter}) {
    return DevFilterState(filter: filter ?? this.filter);
  }

  factory DevFilterState.initial() {
    return DevFilterState(filter: Filter.All);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [filter];

  @override
  // TODO: implement stringify
  bool? get stringify => true;
}

class DevFilterProvider extends StateNotifier<DevFilterState> with LocatorMixin{
  DevFilterProvider() : super(DevFilterState.initial());

  void changeFilter(Filter newFilter){
    state = state.copyWith(filter: newFilter);
  }
}
