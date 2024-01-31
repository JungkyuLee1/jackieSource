import 'package:flutter/material.dart';
import 'package:jackie_hr/pages/detail_pages/schedule_addedit_page.dart';
import 'package:jackie_hr/pages/detail_pages/schedule_detail_view_page.dart';

class ScheduleMainPage extends StatefulWidget {
  const ScheduleMainPage({Key? key}) : super(key: key);

  @override
  _ScheduleMainPageState createState() => _ScheduleMainPageState();
}

class _ScheduleMainPageState extends State<ScheduleMainPage> {
  int _selectedPage = 0;

  void _onTabChanged(index) {
    setState(() {
      _selectedPage = index;
    });
  }

  List<Widget> schedules = [
    ScheduleDetailViewPage(),
    ScheduleAddEditPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: schedules[_selectedPage],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.remove_red_eye), label: '일정 조회'),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: '일정 등록')
        ],
        currentIndex: _selectedPage,
        onTap: _onTabChanged,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.red,
      ),
    );
  }
}
