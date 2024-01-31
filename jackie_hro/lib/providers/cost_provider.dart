import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:jackie_hr/constants/db_constants.dart';
import 'package:jackie_hr/models/cost_model.dart';

class CostListState extends Equatable {
  final bool? loading;
  final List<Cost>? costs;

  CostListState({this.loading, this.costs});

  CostListState copyWith({bool? loading, List<Cost>? costs}) {
    return CostListState(
        loading: loading ?? this.loading, costs: costs ?? this.costs);
  }

  @override
  List<Object?> get props => [loading];

  @override
  bool? get stringify => super.stringify;
}

class CostList extends ChangeNotifier {
  CostListState state = CostListState(loading: false, costs: []);

  //Error 처리
  void handleError(Exception e) {
    state = state.copyWith(loading: false);
    notifyListeners();
  }

  //생성
  Future<void> addCost(Cost newCost) async {
    state = state.copyWith(loading: true);
    notifyListeners();

    try {
      DocumentReference<Map<String, dynamic>> docRef =
          await costRef.doc(newCost.userAccount).collection('userCost').add({
        'depositInOutGb': newCost.depositInOutGb,
        'depositInOutDate': newCost.depositInOutDate,
        'item': newCost.item,
        'price': newCost.price,
        'unit': newCost.unit,
        'remark': newCost.remark,
        'userAccount': newCost.userAccount,
        'createDate': newCost.createDate
      });

      Cost cost = Cost(
          id: docRef.id,
          depositInOutGb: newCost.depositInOutGb,
          depositInOutDate: newCost.depositInOutDate,
          item: newCost.item,
          price: newCost.price,
          unit: newCost.unit,
          remark: newCost.remark,
          userAccount: newCost.userAccount,
          createDate: newCost.createDate);

      state = state.copyWith(loading: false, costs: [cost, ...?state.costs]);
      notifyListeners();
    } catch (e) {
      handleError(throw e);
      // rethrow
    }
  }

  //수정
  Future<void> updateCost(Cost cost) async {
    state = state.copyWith(loading: true);
    notifyListeners();

    try {
      await costRef
          .doc(cost.userAccount)
          .collection('userCost')
          .doc(cost.id)
          .update({
        'depositInOutGb': cost.depositInOutGb,
        'depositInOutDate': cost.depositInOutDate,
        'item': cost.item,
        'price': cost.price,
        'unit': cost.unit,
        'remark': cost.remark,
        'userAccount': cost.userAccount
      });

      final costs = state.costs!
          .map((co) => co.id == cost.id
              ? Cost(
                  id: co.id,
                  depositInOutGb: cost.depositInOutGb,
                  depositInOutDate: cost.depositInOutDate,
                  item: cost.item,
                  price: cost.price,
                  unit: cost.unit,
                  remark: cost.remark,
                  userAccount: cost.userAccount)
              : co)
          .toList();

      state = state.copyWith(loading: false, costs: costs);
      notifyListeners();
    } catch (e) {
      handleError(throw e);
      //rethrow
    }
  }

  //전체 조회
  Future<void> getCost(String userAccount) async {
    state = state.copyWith(loading: true);
    notifyListeners();

    try {
      QuerySnapshot<Map<String, dynamic>> costSnapshot;

      final refCost = costRef
          .doc(userAccount)
          .collection('userCost')
          .orderBy('depositInOutDate', descending: true);

      costSnapshot = await refCost.get();

      List<Cost> costs =
          costSnapshot.docs.map((costDoc) => Cost.fromDoc(costDoc)).toList();

      state = state.copyWith(loading: false, costs: costs);
      notifyListeners();
    } catch (e) {
      handleError(throw e);
      // rethrow;
    }
  }

  //삭제
  Future<void> removeCost(Cost cost) async {
    state = state.copyWith(loading: true);
    notifyListeners();

    try {
      await costRef
          .doc(cost.userAccount)
          .collection('userCost')
          .doc(cost.id)
          .delete();

      final costs = state.costs!.where((co) => co.id != cost.id).toList();

      state = state.copyWith(loading: false, costs: costs);
      notifyListeners();
    } catch (e) {
      handleError(throw e);
      // rethrow;
    }
  }

  //URL 생성
  Future<void> addURL() async {
    try {
      DocumentReference<Map<String, dynamic>> docRef = await urlTableRef
          .doc('SIyR2LufGYMxdUt6WepgOj1Fdwv1')
          .collection('userURL')
          .add({'url': 'https://dev2.sellon.net', 'remark': ''});
    } catch (e) {
      handleError(throw e);
      // rethrow
    }
  }

  //URL 조회
  Future<List> getURL(String userAccount) async {
    try {
      return await urlTableRef.doc(userAccount).collection('userURL').get().then(
          (QuerySnapshot snapshot) =>
              snapshot.docs.map((doc) => doc.data()).toList());
    } catch (e) {
      handleError(throw e);
      // rethrow;
    }
  }
}
