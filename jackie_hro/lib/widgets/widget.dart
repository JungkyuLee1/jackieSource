import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

Future datePickerComm(BuildContext context) async {
  DateTime _date = DateTime.now();

  return await DatePicker.showDatePicker(
    context,
    showTitleActions: true,
    minTime: DateTime(_date.year, 1, 1),
    maxTime: DateTime(_date.year + 3, 12, 31),
    theme: DatePickerTheme(
      headerColor: Colors.orange,
      backgroundColor: Colors.blue,
      itemStyle: TextStyle(
          color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18.0),
      doneStyle: TextStyle(fontSize: 16.0, color: Colors.white),
    ),
    onChanged: (date) {
      // print('Change $date in time zone ' +
      //     date.timeZoneOffset.inHours.toString());
    },
    onConfirm: (date) {
      // print('confirm $date');
    },
    currentTime: _date,
    locale: LocaleType.en,
  );
}

class Header extends StatelessWidget {
  // const Header({Key? key}) : super(key: key);
  final int? depositInOutGb;

  Header({this.depositInOutGb});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 8.0, right: 8.0, bottom: 0.0),
      decoration: BoxDecoration(
          color: Colors.black87,
        borderRadius: BorderRadius.circular(4.0)
      ),
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Row(
          children: [
            Container(
                height: 15.0,
                width: 20.0,
                color: Colors.black87,
                alignment: Alignment.centerRight,
                child: Text('No',
                    style: TextStyle(fontSize: 12.0, color: Colors.white))),
            Container(
                height: 15.0,
                width: 73.0,
                color: Colors.black87,
                alignment: Alignment.center,
                child: Text(depositInOutGb == 0 ? '입금일자' : '출금일자',
                    style: TextStyle(fontSize: 12.0, color: Colors.white))),
            Container(
                height: 15.0,
                width: 95.0,
                color: Colors.black87,
                alignment: Alignment.center,
                child: Text('항목',
                    style: TextStyle(fontSize: 12.0, color: Colors.white))),
            Container(
                height: 15.0,
                width: 73.0,
                color: Colors.black87,
                alignment: Alignment.center,
                child: Text('금액',
                    style: TextStyle(fontSize: 12.0, color: Colors.white))),
             Container(
                height: 15.0,
                width: 65.0,
                color: Colors.black87,
                alignment: Alignment.center,
                child: Text('비고',
                    style: TextStyle(fontSize: 12.0, color: Colors.white))),
          ],
        ),
      ),
    );
  }
}