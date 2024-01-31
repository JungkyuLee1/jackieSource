import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:jackie_hr/pages/master_pages/hr_master_page.dart';
import 'package:jackie_hr/providers/cost_provider.dart';
import 'package:jackie_hr/providers/employee_provider.dart';
import 'package:jackie_hr/providers/schedule/dev_filter_provider.dart';
import 'package:jackie_hr/providers/schedule/dev_ongoing_count_provider.dart';
import 'package:jackie_hr/providers/schedule/dev_ongoing_count_state.dart';
import 'package:jackie_hr/providers/schedule/dev_search_provider.dart';
import 'package:jackie_hr/providers/schedule/schedule_provider.dart';
import 'package:jackie_hr/providers/schedule/schedule_state.dart';
import 'package:jackie_hr/repositories/schedule_repository.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<EmployeeList>(
            create: (context) => EmployeeList()),
        ChangeNotifierProvider(create: (context) => CostList()),
        Provider<ScheduleRepository>(create: (context) => ScheduleRepository()),
        StateNotifierProvider<DevSearchProvider, DevSearchState>(
            create: (context) => DevSearchProvider()),
        StateNotifierProvider<DevFilterProvider, DevFilterState>(
            create: (context) => DevFilterProvider()),
        StateNotifierProvider<ScheduleProvider, ScheduleState>(
            create: (context) => ScheduleProvider()),
        StateNotifierProvider<DevOngoingCountProvider, DevOngoingCountState>(
            create: (context) => DevOngoingCountProvider())
      ],
      child: MaterialApp(
        title: 'SellOn HR&Cost Mgmt.',
        theme: ThemeData(primarySwatch: Colors.red),
        // primaryColor: Theme.of(context).primaryColor),
        debugShowCheckedModeBanner: false,
        home: HrMasterPage(
          selectedPage: 0,
        ),
        routes: {
          '/hrMaster': (context) => HrMasterPage(
                selectedPage: 0,
              ),
        },
      ),
    );
  }
}
