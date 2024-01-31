import 'package:equatable/equatable.dart';
import 'package:state_notifier/state_notifier.dart';

class DevSearchState extends Equatable {
  final String searchTerm;

  DevSearchState({required this.searchTerm});

  factory DevSearchState.initial() {
    return DevSearchState(searchTerm: '');
  }

  DevSearchState copyWith({String? searchTerm}) {
    return DevSearchState(searchTerm: searchTerm ?? this.searchTerm);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [searchTerm];

  @override
  // TODO: implement stringify
  bool? get stringify => true;
}

class DevSearchProvider extends StateNotifier<DevSearchState>
    with LocatorMixin {
  DevSearchProvider() : super(DevSearchState.initial());

  void setSearchTerm(String newSearchTerm) {
    state = state.copyWith(searchTerm: newSearchTerm);
  }
}
