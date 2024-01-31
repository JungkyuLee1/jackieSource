import 'dart:core';

import 'package:flutter/material.dart';
import 'package:jackie_hr/models/employee_model.dart';
import 'package:jackie_hr/providers/employee_provider.dart';
import 'package:jackie_hr/widgets/error_dialog.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:provider/provider.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class HrChartPage extends StatefulWidget {
  const HrChartPage({Key? key}) : super(key: key);

  @override
  _HrChartPageState createState() => _HrChartPageState();
}

enum LegendShape { Circle, Rectangle }

//BarChart DataContainer
class Salary {
  final String? name;
  final int? pay;

  Salary({this.name, this.pay});
}

class _HrChartPageState extends State<HrChartPage> {
  String _userAccount = 'SIyR2LufGYMxdUt6WepgOj1Fdwv1';

  //////////////// PieChart /////////////////////
  double _backendCnt = 0,
      _androidCnt = 0,
      _flutterCnt = 0,
      _iosCnt = 0,
      _sysAdminCnt = 0,
      _testerCnt = 0,
      _csCnt = 0,
      _webCnt = 0,
      _designCnt = 0,
      _totalCnt = 0;

  List<Color> colorList = [
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.blue,
    Colors.indigo,
    Colors.purple,
    Colors.black87
  ];
  LegendShape _legendShape = LegendShape.Rectangle;

  //계산값 초기화
  void _initializeCnt() {
    _backendCnt = 0;
    _flutterCnt =0;
    _androidCnt = 0;
    _iosCnt = 0;
    _sysAdminCnt = 0;
    _testerCnt = 0;
    _csCnt = 0;
    _webCnt = 0;
    _designCnt = 0;
    _totalCnt = 0;
  }

  Map<String, double> getCountByRole(List<Employee> employees) {
    _initializeCnt();

    for (var employee in employees) {
      if (employee.role != null) {
        switch (employee.role) {
          case 'Backend':
            _backendCnt++;
            _totalCnt++;
            break;
          case 'Flutter 개발':
            _flutterCnt++;
            _totalCnt++;
            break;
          case 'Android 개발':
            _androidCnt++;
            _totalCnt++;
            break;
          case 'iOS 개발':
            _iosCnt++;
            _totalCnt++;
            break;
          case 'Web':
            _webCnt++;
            _totalCnt++;
            break;
          case 'Sys Admin':
            _sysAdminCnt++;
            _totalCnt++;
            break;
          case 'Design':
            _designCnt++;
            _totalCnt++;
            break;
          case 'Tester':
            _testerCnt++;
            _totalCnt++;
            break;
          case 'CS':
            _csCnt++;
            _totalCnt++;
            break;
          default:
            break;
        }
      }
    }

    return {
      'Backend': _backendCnt,
      'Flutter' : _flutterCnt,
      'Android': _androidCnt,
      'iOS': _iosCnt,
      'Web': _webCnt,
      'Sys Admin': _sysAdminCnt,
      'Tester': _testerCnt,
      'Design': _designCnt,
      'CS': _csCnt
    };
  }

  ///////////////////////////////////////////////////
  /////////////BarChart/////////////////////////////
  late List<Salary> _salary;
  late List<charts.Series<Salary, String>> _chartData;

  void makeBarChartData(List<Employee> employees) {
    _salary = <Salary>[];
    _chartData = <charts.Series<Salary, String>>[];

    for (Employee employee in employees) {
      _salary.add(
          Salary(name: employee.name!.substring(0, 4), pay: employee.pay!));
    }

    _chartData.add(charts.Series(
        id: 'Salary',
        colorFn: (_, int? val) => charts.MaterialPalette.green.shadeDefault,
        data: _salary,
        domainFn: (Salary salary, _) => salary.name!,
        measureFn: (Salary salary, _) => salary.pay!,
        fillPatternFn: (_, int? val) => charts.FillPatternType.solid,
        // labelAccessorFn: (Salary salary,_) => '${salary.pay} RP',
        displayName: "Salary"));
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      try {
        await context.read<EmployeeList>().getEmployee(_userAccount);
      } catch (e) {
        errorDialog(context, throw e);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final employeeList = context.watch<EmployeeList>().state;

    if (employeeList == null) {
      return Container();
    }

    final pieChart = PieChart(
      key: ValueKey(0),
      dataMap: getCountByRole(employeeList.employees!),
      animationDuration: Duration(milliseconds: 800),
      chartLegendSpacing: 32,
      chartRadius: MediaQuery.of(context).size.width / 3.2,
      colorList: colorList,
      initialAngleInDegree: 0,
      chartType: ChartType.ring,
      ringStrokeWidth: 32,
      centerText: "ROLE",
      legendOptions: LegendOptions(
        showLegendsInRow: false,
        legendPosition: LegendPosition.right,
        showLegends: true,
        legendShape: _legendShape == LegendShape.Circle
            ? BoxShape.circle
            : BoxShape.rectangle,
        legendTextStyle: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      chartValuesOptions: ChartValuesOptions(
        showChartValueBackground: true,
        showChartValues: true,
        showChartValuesInPercentage: false,
        showChartValuesOutside: false,
        decimalPlaces: 0,
      ),
    );
    //BarChart(개인별 급여) 수행
    makeBarChartData(employeeList.employees!);

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              child: Column(
                children: [
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    '역할별 인원(총: ${_totalCnt.toString().split('.')[0]}명)',
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  pieChart
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 12.0, right: 5.0, bottom: 4.0),
              child: Column(
                children: [
                  Text(
                    '직원별 급여 현황',
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  Expanded(
                      child: charts.BarChart(
                    _chartData,
                    animate: true,
                  )),
                  Text('*개인별 급여는 "직원조회"에서 확인할 수 있습니다',style: TextStyle(fontSize: 10.0),)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
