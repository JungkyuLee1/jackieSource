import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_ml_kit_all/controllers/scan_barcode_qr_controller.dart';

class ScanBarcodeQrPage extends GetView<ScanBarcodeQrController> {
  const ScanBarcodeQrPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scan Barcode & QR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  onPressed: () {
                    controller.scanBarcodeNormal();
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
                  child: Text(
                    'Barcode',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  )),
              ElevatedButton(
                  onPressed: () {
                    controller.scanQRCodeNormal();
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
                  child: Text(
                    'QR',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  )),
              ElevatedButton(
                  onPressed: () {
                    controller.streamedBarcodeScan();
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
                  child: Text(
                    'Stream Barcode',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  )),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Text('Result is : '),
          SizedBox(
            height: 10,
          ),
          Obx(
            () => Center(
              child: Text(
                controller.barcodeScanResult.value,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.copyTextToClipboard();
        },
        child: Icon(
          Icons.copy,
          color: Colors.white,
        ),
        backgroundColor: Colors.teal,
      ),
    );
  }
}
