import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:jackie_hr/models/cost_model.dart';
import 'package:jackie_hr/pages/master_pages/hr_master_page.dart';
import 'package:jackie_hr/providers/cost_provider.dart';
import 'package:jackie_hr/widgets/error_dialog.dart';
import 'package:jackie_hr/widgets/widget.dart';
import 'package:provider/provider.dart';

class CostDetailAddEditPage extends StatefulWidget {
  // const CostDetailAddEditPage({Key? key}) : super(key: key);

  final Cost? cost;

  CostDetailAddEditPage({this.cost});

  @override
  _CostDetailAddEditPageState createState() => _CostDetailAddEditPageState();
}

class _CostDetailAddEditPageState extends State<CostDetailAddEditPage> {
  GlobalKey<FormState> _fKey = GlobalKey<FormState>();
  TextEditingController? _depositInOutDateController;
  TextEditingController? _itemController;
  TextEditingController? _priceController;
  TextEditingController? _remarkController;
  Size? size;
  DateTime _date = DateTime.now();
  Timestamp? _depositInOutDate;
  int _depositInOutGb = 0,
      _price = 0;
  String _unit = 'IDR';
  String? _datePicked, _item, _remark;
  String _userAccount = 'SIyR2LufGYMxdUt6WepgOj1Fdwv1';
  AutovalidateMode _autoValidateMode = AutovalidateMode.disabled;

  OutlineInputBorder _border = OutlineInputBorder(
      borderSide: BorderSide(width: 0.0, color: Colors.transparent),
      borderRadius: BorderRadius.circular(12.0));

  void _handleRadioValueChange(int? value) {
    setState(() {
      _depositInOutGb = value!;
    });
  }

  //저장
  void _submit(String mode) async {
    setState(() {
      _autoValidateMode = AutovalidateMode.always;
    });

    if (!_fKey.currentState!.validate()) return;
    _fKey.currentState!.save();

    if (mode == 'Add') {
      try {
        Cost newCost = Cost(
          depositInOutGb: _depositInOutGb,
          depositInOutDate: _depositInOutDate,
          item: _item,
          price: _price,
          unit: _unit,
          remark: _remark ?? '',
          userAccount: _userAccount,
          createDate: Timestamp.fromDate(_date),
        );
        await context.read<CostList>().addCost(newCost);
        //
        // //초기화
        // setState(() {
        //   _autoValidateMode =
        //       AutovalidateMode.disabled; // Validation Check 방지 목적
        //   _initializeItems();
        // });

        ScaffoldMessenger.of(context).showSnackBar(_snackBar);
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> HrMasterPage(selectedPage: 1)), (route) => false);
      } catch (e) {
        errorDialog(context, throw e);
      }
    } else {
      try {
        Cost cost = Cost(
            id: widget.cost!.id,
            depositInOutGb: widget.cost!.depositInOutGb,
            depositInOutDate: _depositInOutDate,
            item: _item,
            price: _price,
            unit: _unit,
            remark: _remark ?? '',
            userAccount: widget.cost!.userAccount,
            createDate: widget.cost!.createDate);

        await context.read<CostList>().updateCost(cost);
        ScaffoldMessenger.of(context).showSnackBar(_snackBar);
        Navigator.pop(context, true);
      } catch (e) {
        errorDialog(context, throw e);
      }
    }
  }

  //저장 후 항목 초기화(Display)
  void _initializeItems() {
    _depositInOutGb = 0;
    _depositInOutDateController?.text = _date.toString().split(' ')[0];
    _itemController?.text = '';
    _priceController?.text = '0';
    _unit = 'IDR';
    _remarkController?.text = '';
  }

  final SnackBar _snackBar = SnackBar(
    content: Text(
      '저장 되었습니다',
      textAlign: TextAlign.center,
    ),
    duration: Duration(seconds: 2),
  );

  @override
  void initState() {
    super.initState();

    _depositInOutDateController = TextEditingController(
        text: widget.cost == null
            ? DateTime.now().toString().split(' ')[0]
            : widget.cost!.depositInOutDate!.toDate().toString().split(' ')[0]);
    _itemController = TextEditingController(
        text: widget.cost == null ? '' : widget.cost?.item);
    _priceController = TextEditingController(
        text: widget.cost == null ? '0' : widget.cost?.price.toString());
    _remarkController = TextEditingController(
        text: widget.cost == null ? '' : widget.cost?.remark);
  }

  @override
  void dispose() {
    super.dispose();
    _depositInOutDateController?.dispose();
    _itemController?.dispose();
    _priceController?.dispose();
    _remarkController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final costList = context
        .read<CostList>()
        .state;
    size = MediaQuery
        .of(context)
        .size;

    return ScaffoldMessenger(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            backgroundColor: Colors.grey[200],
            appBar: AppBar(
              iconTheme: IconThemeData(
                  color: widget.cost != null ? Colors.white : Colors.black87),
              title: Text(
                '입출금 등록',
                style: TextStyle(fontSize: 18.0,
                    color: widget.cost == null ? Colors.black87 : Colors.white),
              ),
              backgroundColor: widget.cost == null ? Colors.grey[200] : Theme
                  .of(context)
                  .primaryColor,
              elevation: 0.0,
              centerTitle: true,
            ),
            body: SingleChildScrollView(
              child: Container(
                height: size!.height * 0.73,
                // color: Colors.yellow,
                margin: EdgeInsets.only(left: 20.0, right: 10.0, bottom: 20.0),
                child: Form(
                    key: _fKey,
                    autovalidateMode: _autoValidateMode,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                    widget.cost == null ?
                    Divider(
                    indent: 2.0,
                      endIndent: 5.0,
                      color: Colors.red,
                    ) : Container(),
                widget.cost != null ?
                SizedBox(height: 10.0,) : Container(),
                Container(
                // color: Colors.red,
                child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 5.0,
                  ),
                  Text('* 구분'),
                  Container(
                    height: 30.0,
                    child: Row(
                      children: [
                        Radio(
                            value: 0,
                            groupValue: widget.cost == null
                                ? _depositInOutGb
                                : widget.cost!.depositInOutGb,
                            onChanged: _handleRadioValueChange,
                        ),
                        Text(
                          '입금',
                          style: TextStyle(fontSize: 14.0),
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        Radio(
                          value: 1,
                          groupValue: widget.cost == null
                              ? _depositInOutGb
                              : widget.cost!.depositInOutGb,
                          onChanged: _handleRadioValueChange,
                        ),
                        Text(
                          '출금',
                          style: TextStyle(fontSize: 14.0),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              width: size!.width * 0.3,
              // color: Colors.blue,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('* 입금/출금 일자'),
                  SizedBox(
                    height: 4.0,
                  ),
                  Container(
                    height: 40.0,
                    child: TextFormField(
                      controller: _depositInOutDateController,
                      readOnly: true,
                      showCursor: true,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 10.0),
                        filled: true,
                        fillColor: Colors.white,
                        border: _border,
                        focusedBorder: _border,
                        enabledBorder: _border,
                      ),
                      onTap: () async {
                        final _dateTimePicked =
                        await datePickerComm(context);

                        if (_dateTimePicked == null) {
                          _datePicked =
                              _depositInOutDateController?.text;
                        } else {
                          _datePicked = _dateTimePicked
                              .toString()
                              .split(' ')[0];
                        }
                        setState(() {
                          _depositInOutDateController?.text =
                          _datePicked!;
                        });
                        _depositInOutDate = Timestamp.fromDate(
                            DateTime.parse(_datePicked!));
                      },
                      onSaved: (value) {
                        _depositInOutDate = Timestamp.fromDate(
                            DateTime.parse(value!));
                      },
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Container(
              // color: Colors.brown,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('* 항목'),
                  SizedBox(
                    height: 4.0,
                  ),
                  Container(
                    height: 45.0,
                    child: TextFormField(
                      controller: _itemController,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 10.0),
                        filled: true,
                        fillColor: Colors.white,
                        border: _border,
                        focusedBorder: _border,
                        enabledBorder: _border,
                      ),
                      validator: (item) {
                        if (item!.trim().isEmpty) return '항목은 필수입니다';
                      },
                      onSaved: (item) {
                        _item = item;
                      },
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('* 금액'),
                  SizedBox(
                    height: 4.0,
                  ),
                  Container(
                    height: 45.0,
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: _priceController,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(
                                  left: 10.0, right: 10.0),
                              filled: true,
                              fillColor: Colors.white,
                              border: _border,
                              focusedBorder: _border,
                              enabledBorder: _border,
                            ),
                            textAlign: TextAlign.right,
                            keyboardType: TextInputType.number,
                            validator: (price) {
                              if (price!.trim().isEmpty)
                                return '금액은 필수입니다';
                              if (int.parse(price) <= 0)
                                return '0은 입력할 수 없습니다';
                            },
                            onSaved: (price) {
                              _price = int.parse(price!);
                            },
                          ),
                        ),
                        SizedBox(
                          width: 15.0,
                        ),
                        Expanded(
                          child: DropdownButtonFormField<String>(
                            onChanged: (value){},
                            value: 'IDR',
                            decoration: InputDecoration(
                                contentPadding:
                                EdgeInsets.only(left: 10.0),
                                filled: true,
                                fillColor: Colors.white,
                                border: _border,
                                focusedBorder: _border,
                                enabledBorder: _border),
                            items: ['IDR', 'WON']
                                .map((unit) =>
                                DropdownMenuItem(
                                    value: unit,
                                    child: Text(
                                      '$unit',
                                      style:
                                      TextStyle(fontSize: 12.0),
                                    )))
                                .toList(),
                            onSaved: (unit) {
                              _unit = unit!;
                            },
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Container(
              // color: Colors.orange,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('* 비고'),
                  SizedBox(
                    height: 4.0,
                  ),
                  Container(
                    height: 50.0,
                    child: TextFormField(
                      controller: _remarkController,
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 10.0),
                        filled: true,
                        fillColor: Colors.white,
                        border: _border,
                        focusedBorder: _border,
                        enabledBorder: _border,
                      ),
                      maxLines: null,
                      onSaved: (remark) {
                        _remark = remark;
                      },
                    ),
                  )
                ],
              ),
            ),
            ButtonBar(
              children: [
                ElevatedButton(
                    onPressed: costList.loading!
                        ? null
                        : () =>
                        _submit(
                            widget.cost == null ? 'Add' : 'Edit'),
                    child: Text('저장')),
              ],
            )
            ],
          ),
        )),)
    ,
    )
    ,
    )
    ,
    );
  }
}
