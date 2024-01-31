import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jackie_hr/models/cost_model.dart';
import 'package:jackie_hr/pages/master_pages/hr_master_page.dart';
import 'package:jackie_hr/providers/cost_provider.dart';
import 'package:jackie_hr/widgets/error_dialog.dart';
import 'package:jackie_hr/widgets/widget.dart';
import 'package:provider/provider.dart';

import 'cost_detail_addedit_page.dart';

class CostDetailViewPage extends StatefulWidget {
  const CostDetailViewPage({Key? key}) : super(key: key);

  @override
  _CostDetailViewPageState createState() => _CostDetailViewPageState();
}

class _CostDetailViewPageState extends State<CostDetailViewPage> {
  String _userAccount = 'SIyR2LufGYMxdUt6WepgOj1Fdwv1';
  Size? size;
  int _balance = 0,
      _totalDepositIn = 0,
      _totalDepositOut = 0;

  //입금,출금액 계산
  int calTotalDeposit(List<Cost>? costs, int depositInOutGb) {
    _totalDepositIn = 0;
    _totalDepositOut = 0;

    for (Cost cost in costs!) {
      _totalDepositIn += cost.depositInOutGb == 0 ? cost.price! : 0; // 입금
      _totalDepositOut += cost.depositInOutGb == 1 ? cost.price! : 0; // 출금
    }
    _balance = _totalDepositIn - _totalDepositOut;

    if (depositInOutGb == 0) {
      // 입금
      return _totalDepositIn;
    } else if (depositInOutGb == 1) {
      //출금
      return _totalDepositOut;
    } else {
      return _balance;
    }
  }

  Widget showDismissibleBackground(int secondary) {
    return Container(
      margin: const EdgeInsets.all(4.0),
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      color: Colors.red,
      alignment: secondary == 0 ? Alignment.centerLeft : Alignment.centerRight,
      child: Icon(
        Icons.delete,
        size: 15.0,
        color: Colors.white,
      ),
    );
  }

  //입금 헤더
  Widget _depositInHeader({required CostListState costList}) {
    return Container(
        margin: EdgeInsets.only(left: 8.0, right: 8.0, bottom: 3.0),
        child: Column(children: [
          Container(
            height: size!.height * 0.04,
            // color: Colors.green,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Text(
                      '1.잔액 : ',
                      style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87),
                    ),
                    Text(
                      NumberFormat('#,###')
                              .format(calTotalDeposit(costList.costs, 2)) +
                          ' IDR',
                      style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueAccent),
                    )
                  ],
                )
              ],
            ),
          ),
          Container(
            height: size!.height * 0.021,
            child: Row(
              children: [
                Text(
                  '2.입금 상세 ',
                  style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87),
                ),
                Text(
                  ('(총액 : ${NumberFormat('#,###').format(calTotalDeposit(costList.costs, 0))} IDR)'),
                  style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87),
                ),
              ],
            ),
          ),
        ]));
  }

  //출금 헤더
  Widget _depositOutHeader({required CostListState costList}) {
    return Container(
      margin: EdgeInsets.only(left: 8.0, right: 8.0, top: 4.0, bottom: 5.0),
      height: size!.height * 0.021,
      child: Row(
        children: [
          Text(
            '3.출금 상세 ',
            style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
                color: Colors.black87),
          ),
          Text(
            ('(총액 : ${NumberFormat('#,###').format(calTotalDeposit(costList.costs, 1))} IDR)'),
            style: TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.bold,
                color: Colors.black87),
          ),
        ],
      ),
    );
  }

  //List 구성(공통)
  Widget _buildList({required Cost cost, required int index}) {
    return Card(
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
                height: 27.0,
                width: 17.0,
                color: Colors.white,
                alignment: Alignment.centerLeft,
                child: CircleAvatar(
                  child: Text(
                    (index).toString(),
                    style: TextStyle(fontSize: 10.0),
                  ),
                  radius: 7.0,
                  backgroundColor: Colors.grey[200],
                )),
            Container(
                height: 27.0,
                width: 71.0,
                color: Colors.white,
                alignment: Alignment.centerLeft,
                child: Text(
                  DateFormat('yyyy-MM-dd')
                      .format(cost!.depositInOutDate!.toDate()),
                  style: TextStyle(fontSize: 12.0),
                )),
            Container(
                height: 27.0,
                width: 90.0,
                color: Colors.white,
                alignment: Alignment.centerLeft,
                child: Text(
                  cost.item!,
                  style: TextStyle(fontSize: 12.0),
                )),
            Container(
              height: 27.0,
              width: 75.0,
              color: Colors.white,
              alignment: Alignment.centerRight,
              child: Text(
                NumberFormat('#,###').format(cost.price!),
                style: TextStyle(fontSize: 12.0),
              ),
            ),
            Container(
                height: 27.0,
                width: 73.0,
                color: Colors.white,
                alignment: Alignment.centerLeft,
                child: Text(
                  cost.remark!,
                  style: TextStyle(fontSize: 12.0),
                )),
          ],
        ),
      ),
    );
  }

  //Body - ListView 구성
  Widget _buildListView(
      {required CostListState costList, required int depositInOutGb}) {
    int index = 1;

    return ListView(children: [
      // Header(
      //   depositInOutGb: depositInOutGb,
      // ),
      ...costList.costs!.map((cost) => cost.depositInOutGb == depositInOutGb
          ? Dismissible(
              key: UniqueKey(),
              onDismissed: (_) async {
                try {
                  await context.read<CostList>().removeCost(cost);
                } catch (e) {
                  errorDialog(context, throw e);
                }
              },
              confirmDismiss: (_) {
                return showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (context) => AlertDialog(
                          title: Text('확인'),
                          content: Text('삭제하시겠습니까?'),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context, true),
                              child: Text('예'),
                            ),
                            TextButton(
                              onPressed: () => Navigator.pop(context, false),
                              child: Text('아니오'),
                            )
                          ],
                        ));
              },
              background: showDismissibleBackground(0),
              secondaryBackground: showDismissibleBackground(1),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CostDetailAddEditPage(
                                cost: cost,
                              ))).then((_) {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HrMasterPage(
                                  selectedPage: 1,
                                )), // ????
                        (route) => false);
                  });
                },
                child: _buildList(cost: cost, index: index++),
              ))
          : Container())
    ]);
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      try {
        await context.read<CostList>().getCost(_userAccount);
      } catch (e) {
        errorDialog(context, throw e);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final costList = context.watch<CostList>().state;
    size = MediaQuery.of(context).size;

    return Scaffold(
        body: Column(
      children: [
        _depositInHeader(costList: costList),
        Header(depositInOutGb: 0),
        Expanded(
          child: Container(
            margin: EdgeInsets.only(left: 8.0, right: 8.0, bottom: 5.0),
            decoration: BoxDecoration(
                border: Border.all(width: 1.0, color: Colors.grey),
                borderRadius: BorderRadius.circular(8.0)),
            child: _buildListView(costList: costList, depositInOutGb: 0), // 입금
          ),
        ),
        _depositOutHeader(costList: costList),
        Header(depositInOutGb: 1),
        Expanded(
          child: Container(
            margin: EdgeInsets.only(left: 8.0, right: 8.0, bottom: 7.0),
            decoration: BoxDecoration(
                border: Border.all(width: 1.0, color: Colors.grey),
                borderRadius: BorderRadius.circular(8.0)),
            child: _buildListView(costList: costList, depositInOutGb: 1),
          ),
        ),
      ],
    ));
  }
}
