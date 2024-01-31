import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:group4/controllers/qr_code_controller.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrCodePage extends GetView<QrCodeController> {
  const QrCodePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR Generation'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Obx(
            () => Column(
              children: [
                QrImage(
                  data: controller.qrCode.value,
                  size: 200,
                  // backgroundColor: Colors.lightBlue,
                  // foregroundColor: Colors.purple,
                ),
                SizedBox(height: 10),
                TextField(
                  controller: controller.qrContentEditingController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      labelText: 'QR Code'),
                  keyboardType: TextInputType.text,
                  onChanged: (val) {
                    controller.qrCode.value = val;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    controller.scanQR();
                  },
                  child: Container(
                    width: 150,
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                        child: Text(
                      'Scan',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    )),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
