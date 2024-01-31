import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:group7_scrollbar/controllers/date_picker_controller.dart';
import 'package:intl/intl.dart';

class DatePickerPage extends GetView<DatePickerController> {
  const DatePickerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Date Picker'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => Text(DateFormat('dd-MM-yyyy')
                .format(controller.selectedDate.value)
                .toString())),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                controller.chooseDate();
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.orange),
                child: Text(
                  'Select Date',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Divider(
              thickness: 2,
              color: Colors.grey[400],
              indent: 20,
              endIndent: 20,
            ),
            SizedBox(
              height: 10,
            ),
            Obx(
              () => Text(
                controller.selectedTime.value.hour.toString() +
                    ':' +
                    controller.selectedTime.value.minute.toString(),
                style: TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                controller.chooseTime();
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.orange),
                child: Text(
                  'Select Time',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Divider(
              thickness: 2,
              color: Colors.grey[400],
              indent: 20,
              endIndent: 20,
            ),
            SizedBox(
              height: 30,
            ),
            Text('<DateRange Picker>', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Obx(() => Text('Start :  ${DateFormat('dd-MM-yyyy').format(controller.dateRange.value.start)}', style: TextStyle(fontSize: 16),)),
                SizedBox(
                  height: 5,
                ),
                Obx(() => Text('End   : ${DateFormat(' dd-MM-yyyy').format(controller.dateRange.value.end)}', style: TextStyle(fontSize: 16),)),
                SizedBox(
                  height: 10,
                ),
              ],
            ),


            GestureDetector(
              onTap: () {
                controller.chooseDateRangePicker();
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.orange),
                child: Text(
                  'Choose Date Range',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
