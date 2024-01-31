import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:jackie_hr/constants/db_constants.dart';
import 'package:jackie_hr/models/employee_model.dart';
import 'package:equatable/equatable.dart';

class EmployeeListState extends Equatable {
  final bool? loading;
  final List<Employee>? employees;

  EmployeeListState({this.loading, this.employees});

  EmployeeListState copyWith({bool? loading, List<Employee>? employees}) {
    return EmployeeListState(
        loading: loading ?? this.loading,
        employees: employees ?? this.employees);
  }

  @override
  bool? get stringify => super.stringify;

  @override
  List<Object?> get props => [loading];
}

class EmployeeList extends ChangeNotifier {
  EmployeeListState? state = EmployeeListState(loading: false, employees: []);

  //Error Handling
  void handleError(Exception e) {
    state = state!.copyWith(loading: false);
    notifyListeners();
  }

  //검색용 Array 생성 함수
  List<String> generateSearchKeywords(String? inputText) {
    List<String> splitList = inputText!.split(" ");
    List<String> indexList = [];

    for (int i = 0; i < splitList.length; i++) {
      for (int j = 1; j < splitList[i].length + 1; j++) {
        indexList.add(splitList[i].substring(0, j).toLowerCase());
      }
    }
    return indexList;
  }

  //전체 조회
  Future<void> getEmployee(String userAccount) async {
    state = state!.copyWith(loading: true);
    notifyListeners();

    try {
      QuerySnapshot<Map<String, dynamic>> employeeSnapshot;

      final refEmployee = employeeRef
          .doc(userAccount)
          .collection('userEmployee')
          .orderBy('role');

      employeeSnapshot = await refEmployee.get();

      List<Employee> employees = employeeSnapshot.docs
          .map((employeeDoc) => Employee.fromDoc(employeeDoc))
          .toList();

      state = state!.copyWith(
          loading: false, employees: employees);
      notifyListeners();
    } catch (e) {
      handleError(throw e);
      // rethrow;
    }
  }

  //생성
  Future<void> addEmployee(Employee newEmployee) async {
    state = state!.copyWith(loading: true);
    notifyListeners();

    try {
      DocumentReference docRef = await employeeRef
          .doc(newEmployee.userAccount)
          .collection('userEmployee')
          .add({
        'name': newEmployee.name,
        'nameSearch': generateSearchKeywords(newEmployee.name),
        'pictureUrl': newEmployee.pictureUrl,
        'role': newEmployee.role,
        'startDate': newEmployee.startDate,
        'careerYear': newEmployee.careerYear,
        'pay': newEmployee.pay,
        'unit': newEmployee.unit,
        'skillSet': newEmployee.skillSet,
        'cellNo': newEmployee.cellNo,
        'email': newEmployee.email,
        'birthday': newEmployee.birthday,
        'marriage': newEmployee.marriage,
        'familyHistory': newEmployee.familyHistory,
        'bankName': newEmployee.bankName,
        'bankAccount': newEmployee.bankAccount,
        'remark': newEmployee.remark,
        'userAccount': newEmployee.userAccount,
        'createDate': newEmployee.createDate,
      });

      Employee employee = Employee(
          id: docRef.id,
          name: newEmployee.name,
          pictureUrl: newEmployee.pictureUrl,
          role: newEmployee.role,
          startDate: newEmployee.startDate,
          careerYear: newEmployee.careerYear,
          pay: newEmployee.pay,
          unit: newEmployee.unit,
          skillSet: newEmployee.skillSet,
          cellNo: newEmployee.cellNo,
          email: newEmployee.email,
          birthday: newEmployee.birthday,
          marriage: newEmployee.marriage,
          familyHistory: newEmployee.familyHistory,
          bankName: newEmployee.bankName,
          bankAccount: newEmployee.bankAccount,
          remark: newEmployee.remark,
          userAccount: newEmployee.userAccount,
          createDate: newEmployee.createDate);

      state = state!
          .copyWith(loading: false, employees: [employee, ...?state!.employees]);
      notifyListeners();
    } catch (e) {
      print(e);
      handleError(throw e);
      // rethrow;
    }
  }

  //검색(이름) Query
  Future<List<Employee>> searchEmployee(
      {String? userAccount, String? searchTerm}) async {
    QuerySnapshot<Map<String, dynamic>> employeeSnapshot;

    try {
      employeeSnapshot = await employeeRef
          .doc(userAccount)
          .collection('userEmployee')
          .where('nameSearch', arrayContains: searchTerm?.toLowerCase())
          .get();

      return employeeSnapshot.docs
          .map((employeeDoc) => Employee.fromDoc(employeeDoc))
          .toList();
    } catch (e) {
      handleError(throw e);
      // rethrow;
    }
  }

  //수정
  Future<void> updateEmployee(Employee employee) async {
    state = state!.copyWith(loading: true);
    notifyListeners();

    try {
      await employeeRef
          .doc(employee.userAccount)
          .collection('userEmployee')
          .doc(employee.id)
          .update({
        'name': employee.name,
        'nameSearch': generateSearchKeywords(employee.name),
        'pictureUrl': employee.pictureUrl,
        'role': employee.role,
        'startDate': employee.startDate,
        'careerYear': employee.careerYear,
        'pay': employee.pay,
        'unit': employee.unit,
        'skillSet': employee.skillSet,
        'cellNo': employee.cellNo,
        'email': employee.email,
        'birthday': employee.birthday,
        'marriage': employee.marriage,
        'familyHistory': employee.familyHistory,
        'bankName': employee.bankName,
        'bankAccount': employee.bankAccount,
        'remark': employee.remark,
        'userAccount': employee.userAccount,
      });

      final employees = state!.employees!
          .map((e) => e.id == employee.id
              ? Employee(
                  id: e.id,
                  name: employee.name,
                  pictureUrl: employee.pictureUrl,
                  role: employee.role,
                  startDate: employee.startDate,
                  careerYear: employee.careerYear,
                  pay: employee.pay,
                  unit: employee.unit,
                  skillSet: employee.skillSet,
                  cellNo: employee.cellNo,
                  email: employee.email,
                  birthday: employee.birthday,
                  marriage: employee.marriage,
                  familyHistory: employee.familyHistory,
                  bankName: employee.bankName,
                  bankAccount: employee.bankAccount,
                  remark: employee.remark,
                  userAccount: employee.userAccount)
              : e)
          .toList();

      state = state!.copyWith(loading: false, employees: employees);
      notifyListeners();
    } catch (e) {
      handleError(throw e);
      // rethrow;
    }
  }

  //삭제
  Future<void> removeEmployee(Employee employee) async {
    state = state!.copyWith(loading: true);
    notifyListeners();

    try {
      await employeeRef
          .doc(employee.userAccount)
          .collection('userEmployee')
          .doc(employee.id)
          .delete();

      final employees =
          state!.employees!.where((emp) => emp.id != employee.id).toList();

      state = state!.copyWith(loading: false, employees: employees);
      notifyListeners();
    } catch (e) {
      handleError(throw e);
      // rethrow;
    }
  }
}
