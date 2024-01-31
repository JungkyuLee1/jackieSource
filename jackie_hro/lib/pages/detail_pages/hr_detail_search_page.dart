import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:jackie_hr/models/employee_model.dart';
import 'package:jackie_hr/pages/detail_pages/hr_detail_addedit_page.dart';
import 'package:jackie_hr/providers/employee_provider.dart';
import 'package:jackie_hr/widgets/util.dart';
import 'package:provider/provider.dart';

class HrDetailSearchPage extends StatefulWidget {
  // const HrDetailSearchPage({Key? key}) : super(key: key);

  final String? userAccount;

  HrDetailSearchPage({this.userAccount});

  @override
  _HrDetailSearchPageState createState() => _HrDetailSearchPageState();
}

class _HrDetailSearchPageState extends State<HrDetailSearchPage> {
  TextEditingController? _searchTermController;
  List<Employee>? employees;
  String? _searchTerm;
  Size? size;

  OutlineInputBorder _border = OutlineInputBorder(
      borderSide: BorderSide(width: 0.0, color: Colors.transparent),
      borderRadius: BorderRadius.circular(12.0));

  @override
  void initState() {
    super.initState();

    _searchTermController = TextEditingController();
  }

  void _clearSearch() {
    setState(() {
      employees = null;
      _searchTermController?.text = '';
    });
  }

  @override
  void dispose() {
    super.dispose();
    _searchTermController?.dispose();
  }

  final SnackBar _snackBar = SnackBar(
    content: Text('검색되었습니다'),
    duration: Duration(seconds: 5),
  );

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    return ScaffoldMessenger(
      child: Scaffold(
          appBar: AppBar(
            title: Container(
              height: size!.height * 0.05,
              width: size!.width * 0.65,
              child: TextField(
                controller: _searchTermController,
                style: TextStyle(color: Colors.black87),
                textInputAction: TextInputAction.search,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(top:7.0),
                    border: _border,
                    focusedBorder: _border,
                    enabledBorder: _border,
                    filled: true,
                    fillColor: Colors.white,
                    hintText: '이름 검색',
                    hintStyle: TextStyle(color: Colors.black54),
                    prefixIcon: Icon(
                      Icons.search,
                      size: 20.0,
                      color: Colors.black87,
                    ),
                    suffixIcon: IconButton(
                      onPressed: _clearSearch,
                      icon: Icon(
                        Icons.clear_outlined,
                        size: 20.0,
                        color: Colors.black87,
                      ),
                    )),
                onSubmitted: (val) async {
                  _searchTerm = val.trim();
                  if (_searchTerm!.isNotEmpty) {
                    employees = await context
                        .read<EmployeeList>()
                        .searchEmployee(
                            userAccount: widget.userAccount,
                            searchTerm: _searchTerm);

                    setState(() {});

                    // Fluttertoast.showToast(
                    //     msg: 'okk',
                    //     toastLength: Toast.LENGTH_LONG,
                    //     gravity: ToastGravity.CENTER,
                    //     timeInSecForIosWeb: 1);
                    // ScaffoldMessenger.of(context).showSnackBar(_snackBar);
                  }
                },
              ),
            ),
          ),
          body: employees == null
              ? Center(
                  child: Text(
                    '직원을 검색하세요',
                    style: TextStyle(fontSize: 20.0),
                  ),
                )
              : employees!.isEmpty
                  ? Center(
                      child: Text(
                        '직원이 존재하지 않습니다',
                        style: TextStyle(fontSize: 20.0),
                      ),
                    )
                  : ListView.builder(
                      itemCount: employees!.length,
                      itemBuilder: (context, index) {
                        final employee = employees![index];

                        return GestureDetector(
                          onTap: () async {
                            final modified = await Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HrDetailAddEditPage(
                                          employee: employee,
                                        )));
                            if (modified) {
                              employees = await context
                                  .read<EmployeeList>()
                                  .searchEmployee(
                                      userAccount: widget.userAccount,
                                      searchTerm: _searchTerm);
                              setState(() {});
                            }
                          },
                          child: Container(
                              margin: EdgeInsets.fromLTRB(8.0, 10.0, 8.0, 0.0),
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
                                        '${employees!.indexOf(employee) + 1}',
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
                                      child: Image.network(
                                        employee.pictureUrl!,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(12.0)),
                                  ),
                                  SizedBox(
                                    width: 20.0,
                                  ),
                                  Flexible(
                                    child: Padding(
                                      padding: const EdgeInsets.only(top:5.0, bottom: 5.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                          Text(commaConvert('${employee.pay!} IDR'), style: TextStyle(fontSize:14.0),),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                        );
                      })),
    );
  }
}
