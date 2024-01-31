import 'package:cloud_firestore/cloud_firestore.dart';

class Cost {
  final String? id;
  final int? depositInOutGb;
  final Timestamp? depositInOutDate;
  final String? item;
  final int? price;
  final String? unit;
  final String? remark;
  final String? userAccount;
  final Timestamp? createDate;

  Cost(
      {this.id,
      this.depositInOutGb,
      this.depositInOutDate,
      this.item,
      this.price,
      this.unit,
      this.remark,
      this.userAccount,
      this.createDate});

  Cost.fromDoc(DocumentSnapshot<Map<String, dynamic>> costDoc)
      : id = costDoc.id,
        depositInOutGb = costDoc.data()?['depositInOutGb'] ?? 0,
        depositInOutDate = costDoc.data()?['depositInOutDate'] ?? Timestamp.fromDate(DateTime.now()),
        item = costDoc.data()?['item'] ?? '',
        price = costDoc.data()?['price'] ?? 0,
        unit = costDoc.data()?['unit'] ?? 'IDR',
        remark = costDoc.data()?['remark'] ?? '',
        userAccount = costDoc.data()?['userAccount'] ?? '',
        createDate = costDoc.data()?['createDate'] ?? Timestamp.fromDate(DateTime.now());

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'depositInOutGb': depositInOutGb,
      'depositInoOutDate': depositInOutDate,
      'item': item,
      'price': price,
      'unit': unit,
      'remark': remark,
      'userAccount': userAccount,
      'createDate': createDate
    };
  }
}
