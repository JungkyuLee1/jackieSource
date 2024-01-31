import 'package:flutter/material.dart';
import 'package:jackie_hr/pages/detail_pages/cost_main_page.dart';
import 'package:jackie_hr/pages/detail_pages/homepage_main_page.dart';
import 'package:jackie_hr/pages/detail_pages/hr_main_page.dart';
import 'package:jackie_hr/pages/detail_pages/welfare_main_page.dart';

import '../detail_pages/schedule_main_page.dart';

class HrMasterPage extends StatelessWidget {
  // const HrMasterPage({Key? key}) : super(key: key);
  int selectedPage;
  HrMasterPage({required this.selectedPage});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        initialIndex: selectedPage,
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            title: TabBar(
                // indicator: UnderlineTabIndicator(
                //   borderSide: BorderSide(color: Colors.grey, width: 2)
                // ),
                indicatorColor: Colors.white,
                indicatorWeight: 5,
                tabs: [
              Tab(
                icon: Icon(Icons.person),
                text: '직원관리',
              ),
              Tab(
                icon: Icon(Icons.manage_accounts),
                text: '경비관리',
              ),
              Tab(icon:Icon(Icons.schedule), text: '개발일정'),
              Tab(icon: Icon(Icons.home), text: '홈페이지')
            ]),
            iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
            // centerTitle: true,
          ),
          body: TabBarView(
              children: [HrMainPage(), CostMainPage(), ScheduleMainPage(), HomePageMain()]),
        ));
  }
}
