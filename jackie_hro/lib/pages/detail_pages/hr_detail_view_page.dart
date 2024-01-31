import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:jackie_hr/models/employee_model.dart';
import 'package:jackie_hr/pages/detail_pages/hr_detail_addedit_page.dart';
import 'package:jackie_hr/pages/detail_pages/hr_detail_search_page.dart';
import 'package:jackie_hr/pages/master_pages/hr_master_page.dart';
import 'package:jackie_hr/providers/employee_provider.dart';
import 'package:jackie_hr/widgets/error_dialog.dart';
import 'package:jackie_hr/widgets/util.dart';
import 'package:provider/provider.dart';

class HrDetailViewPage extends StatefulWidget {
  const HrDetailViewPage({Key? key}) : super(key: key);

  @override
  _HrDetailViewPageState createState() => _HrDetailViewPageState();
}

class _HrDetailViewPageState extends State<HrDetailViewPage> {
  String _userAccount = 'SIyR2LufGYMxdUt6WepgOj1Fdwv1';
  bool isLoading = false;
  Size? size;
  double _totalTempPay = 0.0;

  Widget showDismissibleBackground(int secondary) {
    return Container(
      margin: const EdgeInsets.all(4.0),
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      color: Colors.red,
      alignment: secondary == 0 ? Alignment.centerLeft : Alignment.centerRight,
      child: Icon(
        Icons.delete,
        size: 30.0,
        color: Colors.white,
      ),
    );
  }

  Widget buildBody(EmployeeListState employeeList) {
    if (employeeList.loading ??
        !isLoading && employeeList.employees?.length == 0) {
      setState(() {
        isLoading = true;
      });
      return Center(child: CircularProgressIndicator());
    }

    if (employeeList.employees?.length == 0) {
      return Center(
        child: Text(
          '직원을 등록하세요',
          style: TextStyle(fontSize: 20.0),
        ),
      );
    }

    return ListView(
      children: [
        Divider(
          indent: 20.0,
          endIndent: 20.0,
          color: Colors.red,
        ),
        ...employeeList.employees!.map((employee) => Dismissible(
            key: UniqueKey(),
            onDismissed: (_) async {
              try {
                await context.read<EmployeeList>().removeEmployee(employee);
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => HrMasterPage(selectedPage: 0)),
                    (route) => false);
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
                        builder: (context) => HrDetailAddEditPage(
                              employee: employee,
                            ))).then((_) {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HrMasterPage(
                                selectedPage: 0,
                              )),
                      (route) => false);
                });
              },
              child: Container(
                  margin: EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 5.0),
                  height: 70.0,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: CircleAvatar(
                          child: Text(
                            '${employeeList.employees!.indexOf(employee) + 1}',
                            style: TextStyle(color: Colors.black87),
                          ),
                          backgroundColor: Colors.grey[200],
                        ),
                      ),
                      SizedBox(
                        width: 8.0,
                      ),
                      Card(
                        clipBehavior: Clip.antiAlias,
                        child: AspectRatio(
                            aspectRatio: 1.1,
                            child: CachedNetworkImage(
                              imageUrl: employee.pictureUrl!,
                              placeholder: (context, url) => Container(
                                height: 100,
                                child:
                                Center(child: CircularProgressIndicator()),
                              ),
                              fit: BoxFit.cover,
                            )),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0)),
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                employee.name!,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                employee.role!,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontSize: 14.0),
                              ),
                              Text(
                                commaConvert('${employee.pay!} IDR'),
                                style: TextStyle(fontSize: 14.0),
                              ),
                              // Text(DateFormat('yyyy-MM-dd').format(employee.startDate!.toDate()))
                            ],
                          ),
                        ),
                      ),
                    ],
                  )),
            )))
      ],
    );
  }

  //총급여 계산(AppBar 표시)
  double getTotalPay(List<Employee>? employees) {
    _totalTempPay = 0;
    for (var employee in employees!) {
      _totalTempPay += employee.pay!;
    }
    return _totalTempPay / 1000000;
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
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final employeeList = context.watch<EmployeeList>().state;
    size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
          title: Container(
            child: Column(
              children: [
                Text(
                  '전체 직원',
                  style: TextStyle(color: Colors.black87, fontSize: 18.0),
                ),
                Text(
                  '(총원 : ${employeeList!.employees?.length} 명, 총급여: ${getTotalPay(employeeList.employees)} (백만,IDR))',
                  style: TextStyle(color: Colors.black87, fontSize: 14.0),
                ),
              ],
            ),
          ),
          backgroundColor: Colors.white,
          elevation: 0.0,
          centerTitle: true,
          ////Menu 사용 시 적용(Portfolio2)
          // leading: IconButton(
          //   onPressed: () {
          //     Navigator.pushAndRemoveUntil(context,
          //         MaterialPageRoute(builder: (context) => MenuPage()), (
          //             route) => false);
          //   },
          //   icon: Icon(Icons.arrow_back_ios_outlined),
          //   color: Colors.black87,
          // ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => HrDetailSearchPage(
                              userAccount: _userAccount,
                            )));
              },
              tooltip: '직원 조회',
              icon: Icon(
                Icons.search,
                color: Colors.black87,
              ),
            ),
          ]),
      body: buildBody(employeeList),
    );
  }
}
