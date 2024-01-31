import 'package:flutter/material.dart';
import 'package:jackie_hr/pages/detail_pages/cost_detail_view_page.dart';

import 'cost_detail_addedit_page.dart';

class CostMainPage extends StatefulWidget {
  const CostMainPage({Key? key}) : super(key: key);

  @override
  _CostMainPageState createState() => _CostMainPageState();
}

class _CostMainPageState extends State<CostMainPage> {
  int _selectedPage = 0;

  void _onTabChanged(index) {
    setState(() {
      _selectedPage = index;
    });
  }

  List<Widget> costs = [
    CostDetailViewPage(),
    CostDetailAddEditPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: costs[_selectedPage],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.money), label: '비용 현황'),
          BottomNavigationBarItem(icon: Icon(Icons.money_off), label: '비용 등록')
        ],
        currentIndex: _selectedPage,
        onTap: _onTabChanged,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.red,
      ),
    );
  }
}
