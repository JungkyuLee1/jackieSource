import 'package:jackie_hr/providers/schedule/dev_filter_provider.dart';
import 'package:jackie_hr/providers/schedule/dev_ongoing_count_state.dart';
import 'package:jackie_hr/providers/schedule/schedule_state.dart';
import 'package:state_notifier/state_notifier.dart';

import '../../models/schedule_model.dart';
import 'dev_search_provider.dart';

class DevOngoingCountProvider extends StateNotifier<DevOngoingCountState>
    with LocatorMixin {
  DevOngoingCountProvider() : super(DevOngoingCountState(count: 0));

  @override
  void update(Locator watch) {
    super.update(watch);

    //전체 Ongoing 개수를 보여주기 위함
    if (watch<DevFilterState>().filter == Filter.All &&
        watch<DevSearchState>().searchTerm.isEmpty) {
      final onGoingCount = watch<ScheduleState>()
          .schedules
          .where((schedule) => schedule.completeStatus == 'ongoing')
          .toList()
          .length;

      state = state.copyWith(count: onGoingCount);
    }
  }
}
