import 'package:flutter/material.dart';
import 'package:jackie_hr/pages/detail_pages/hr_chart_page.dart';

import 'hr_detail_addedit_page.dart';
import 'hr_detail_view_page.dart';

class HrMainPage extends StatefulWidget {
  const HrMainPage({Key? key}) : super(key: key);

  @override
  _HrMainPageState createState() => _HrMainPageState();
}

class _HrMainPageState extends State<HrMainPage> {
  int _selectedPage = 0;

  void _onTabChanged(int index){
    setState(() {
      _selectedPage=index;
    });
  }

  List<Widget> hrs = [
    HrDetailViewPage(),
    HrDetailAddEditPage(employee: null),
    HrChartPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: hrs[_selectedPage],
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.view_agenda), label: '직원조회'),
            BottomNavigationBarItem(
                icon: Icon(Icons.app_registration), label: '직원등록'),
            BottomNavigationBarItem(icon: Icon(Icons.report), label: '현황')
          ],
          currentIndex: _selectedPage,
          onTap: _onTabChanged,
          backgroundColor: Colors.white,
          selectedItemColor: Colors.red   ,
        ));
  }
}
