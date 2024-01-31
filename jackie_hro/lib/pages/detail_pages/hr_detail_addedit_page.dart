import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:jackie_hr/constants/color_constants.dart';
import 'package:jackie_hr/models/employee_model.dart';
import 'package:jackie_hr/pages/master_pages/hr_master_page.dart';
import 'package:jackie_hr/providers/employee_provider.dart';
import 'package:jackie_hr/widgets/error_dialog.dart';
import 'package:provider/provider.dart';

class HrDetailAddEditPage extends StatefulWidget {
  // const HrDetailAddEditPage({Key? key}) : super(key: key);
  final Employee? employee;

  HrDetailAddEditPage({this.employee});

  @override
  _HrDetailAddEditPageState createState() => _HrDetailAddEditPageState();
}

class _HrDetailAddEditPageState extends State<HrDetailAddEditPage> {
  GlobalKey<FormBuilderState> _fbKey1 = GlobalKey<FormBuilderState>();
  GlobalKey<FormBuilderState> _fbKey2 = GlobalKey<FormBuilderState>();
  TextEditingController? _nameController,
      _careerYearController,
      _payController,
      _skillSetController,
      _cellNoController,
      _emailController;
  TextEditingController? _familyHistoryController,
      _bankNameController,
      _bankAccountController,
      _remarkController;
  PageController? _pageController;
  Timestamp? _startDate = Timestamp.fromDate(DateTime.now()),
      _createDate = Timestamp.fromDate(DateTime.now()),
      _birthday;
  String _unit = 'IDR', _marriage = '미혼';
  String? _name,
      _pictureUrl,
      _role,
      _skillSet,
      _cellNo,
      _email,
      _familyHistory,
      _bankName,
      _bankAccount,
      _remark;
  double _careerYear = 0.0, _page = 0.0;
  int _pay = 0, _currentPage = 0;

  OutlineInputBorder _border = OutlineInputBorder(
      borderSide: BorderSide(width: 0.0, color: Colors.transparent),
      borderRadius: BorderRadius.circular(12.0));

  List<String> roles = [
    'Android 개발',
    'iOS 개발',
    'Flutter 개발',
    'Backend',
    'Web',
    'Sys Admin',
    'Design',
    'CS',
    'Tester'
  ];
  Size? size;
  File? _avatarImageFile;
  final ImagePicker _picker = ImagePicker();

  // List<PickedFile>? _imageFileList; // Web 처리용용 (dart.html 패키지 사용시)

  // //Image(사진 불러오기) // Web 처리용
  // set _imageFile(PickedFile? value) {
  //   _imageFileList = value == null ? null : [value];
  // }

  Future _getImage() async {
    try {
      final pickedFile = await _picker.getImage(source: ImageSource.gallery);
      File _image = File(pickedFile!.path);

      setState(() {
        _avatarImageFile = _image;
      });
    } catch (e) {
      errorDialog(context, throw e);
    }

    // setState(() {   // Web 처리
    //   _imageFile = pickedFile;
    // });
    // File image = File(_imageFileList!, _imageFileList[0].path); //Web 처리용
  }

  //사진 저장
  Future uploadFile() async {
    Reference reference =
        FirebaseStorage.instance.ref().child(_name!); // 직원 ID별 사진 저장
    UploadTask uploadTask = reference.putFile(_avatarImageFile!);
    TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() async {
      String downloadUrl = await reference.getDownloadURL();
      _pictureUrl = downloadUrl;
    });
  }

  final SnackBar _snackBar = SnackBar(
    content: Text(
      '저장 되었습니다',
      textAlign: TextAlign.center,
    ),
    duration: Duration(seconds: 2),
  );

  //첫번째 화면 저장
  void _submit(String mode) async {
    if (_avatarImageFile != null) {
      // 이미지 생성/변경 했을 경우만 수행
      await uploadFile(); // 사진 저장
    }

    if (mode == 'Add') {
      try {
        Employee newEmployee = Employee(
            name: _name,
            pictureUrl: _pictureUrl ??
                'https://louisville.edu/enrollmentmanagement/images/person-icon/image',
            role: _role,
            startDate: _startDate,
            careerYear: _careerYear,
            pay: _pay,
            unit: _unit,
            skillSet: _skillSet,
            cellNo: _cellNo,
            email: _email,
            birthday: _birthday,
            marriage: _marriage,
            familyHistory: _familyHistory ?? '',
            bankName: _bankName ?? '',
            bankAccount: _bankAccount ?? '',
            remark: _remark ?? '',
            userAccount: 'SIyR2LufGYMxdUt6WepgOj1Fdwv1',
            createDate: _createDate);

        await context.read<EmployeeList>().addEmployee(newEmployee);
        CircularProgressIndicator();
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (context) => HrMasterPage(selectedPage: 0)),
            (route) => false);

        ScaffoldMessenger.of(context).showSnackBar(_snackBar);
      } catch (e) {
        errorDialog(context, throw e);
      }
    } else {
      // Edit
      try {
        Employee newEmployee = Employee(
            id: widget.employee!.id,
            name: _name,
            pictureUrl: _avatarImageFile == null
                ? widget.employee!.pictureUrl
                : _pictureUrl,
            role: _role,
            startDate: _startDate,
            careerYear: _careerYear,
            pay: _pay,
            unit: _unit,
            skillSet: _skillSet,
            cellNo: _cellNo,
            email: _email,
            birthday: _birthday,
            marriage: _marriage,
            familyHistory: _familyHistory ?? '',
            bankName: _bankName ?? '',
            bankAccount: _bankAccount ?? '',
            remark: _remark ?? '',
            userAccount: widget.employee!.userAccount,
            createDate: widget.employee!.createDate);

        await context.read<EmployeeList>().updateEmployee(newEmployee);
        CircularProgressIndicator();
        Navigator.pop(context, true);
      } catch (e) {
        errorDialog(context, throw e);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _nameController = TextEditingController(
        text: widget.employee == null ? '' : widget.employee?.name);
    _careerYearController = TextEditingController(
        text: widget.employee == null
            ? ''
            : widget.employee?.careerYear.toString());
    _payController = TextEditingController(
        text: widget.employee == null ? '0' : widget.employee?.pay.toString()); // NumberFormat('#,###').format(widget.employee?.pay).toString());
    _skillSetController = TextEditingController(
        text: widget.employee == null ? '' : widget.employee?.skillSet);
    _cellNoController = TextEditingController(
        text: widget.employee == null ? '' : widget.employee?.cellNo);
    _emailController = TextEditingController(
        text: widget.employee == null ? '' : widget.employee?.email);
    _familyHistoryController = TextEditingController(
        text: widget.employee == null ? '' : widget.employee?.familyHistory);
    _bankNameController = TextEditingController(
        text: widget.employee == null ? '' : widget.employee?.bankName);
    _bankAccountController =
        TextEditingController(text: widget.employee?.bankAccount);
    _remarkController = TextEditingController(
        text: widget.employee == null ? '' : widget.employee?.remark);
  }

  @override
  void dispose() {
    super.dispose();
    _nameController?.dispose();
    _pageController?.dispose();
    _careerYearController?.dispose();
    _payController?.dispose();
    _skillSetController?.dispose();
    _cellNoController?.dispose();
    _emailController?.dispose();
    _familyHistoryController?.dispose();
    _bankNameController?.dispose();
    _bankAccountController?.dispose();
    _remarkController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    final employeeList = context.watch<EmployeeList>().state;

    return ScaffoldMessenger(
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
            backgroundColor: Colors.grey[200],
            appBar: AppBar(
                iconTheme: IconThemeData(
                    color: widget.employee != null
                        ? Colors.white
                        : Colors.black87),
                title: Text(
                  '인사 정보',
                  style: TextStyle(
                      fontSize: 18.0,
                      color: widget.employee != null
                          ? Colors.white
                          : Colors.black87),
                ),
                backgroundColor: widget.employee == null
                    ? Colors.grey[200]
                    : Theme.of(context).primaryColor,
                elevation: 0.0,
                centerTitle: true),
            body: ListView(
              children: [
                widget.employee == null
                    ? Divider(
                        indent: 20.0,
                        endIndent: 20.0,
                        color: Colors.red,
                      )
                    : Container(),
                widget.employee != null
                    ? SizedBox(
                        height: 10.0,
                      )
                    : Container(),
                Container(
                  height: widget.employee != null ? 40.0 : 30.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextButton(
                          onPressed: () {},
                          child: _page == 0.0
                              ? Text(
                                  '1.Basic Info.',
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red),
                                )
                              : Text('1.Basic Info.',
                                  style: TextStyle(
                                      fontSize: 15.0, color: Colors.black87))),
                      Icon(Icons.arrow_forward_ios),
                      TextButton(
                          onPressed: () {},
                          child: _page == 1.0
                              ? Text(
                                  '2.Bank Info.',
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red),
                                )
                              : Text('2.Bank Info.',
                                  style: TextStyle(
                                      fontSize: 15.0, color: Colors.black87))),
                    ],
                  ),
                ),
                widget.employee != null
                    ? SizedBox(
                        height: 13.0,
                      )
                    : Container(),
                // SizedBox(
                //   height: 5.0,
                // ),
                Container(
                  height: size!.height * 0.67,
                  margin: EdgeInsets.fromLTRB(15.0, 0, 15.0, 0),
                  child: PageView(
                    physics: NeverScrollableScrollPhysics(),
                    onPageChanged: (selectedPage) {
                      _currentPage = selectedPage;
                    },
                    controller: _pageController,
                    children: [
                      FormBuilder(
                        key: _fbKey1,
                        child: Column(
                          children: [
                            Container(
                              height: 130.0,
                              width: double.infinity,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Stack(
                                    children: [
                                      _avatarImageFile == null
                                          ? widget.employee?.pictureUrl != null
                                              ? Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 5.0,
                                                          left: 4.0,
                                                          bottom: 3.0),
                                                  child: Material(
                                                    child: CachedNetworkImage(
                                                      placeholder:
                                                          (context, url) =>
                                                              Container(
                                                        child:
                                                            CircularProgressIndicator(
                                                          strokeWidth: 20.0,
                                                          valueColor:
                                                              AlwaysStoppedAnimation<
                                                                  Color>(
                                                            Colors.red,
                                                          ),
                                                        ),
                                                        width: 50.0,
                                                        height: 50.0,
                                                        padding: EdgeInsets.all(
                                                            30.0),
                                                      ),
                                                      imageUrl: widget.employee!
                                                          .pictureUrl!,
                                                      width: 106.0,
                                                      height: 106.0,
                                                      fit: BoxFit.cover,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                      Radius.circular(15.0),
                                                    ),
                                                    clipBehavior: Clip.hardEdge,
                                                  ),
                                                )
                                              : Icon(
                                                  Icons.circle,
                                                  size: 90.0,
                                                  color: Colors.transparent,
                                                )
                                          : Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 5.0, top: 6.0),
                                              child: Container(
                                                height: 105.0,
                                                width: 105.0,
                                                child: Material(
                                                  child: Image.file(
                                                    _avatarImageFile!,
                                                    width: 115.0,
                                                    height: 115.0,
                                                    fit: BoxFit.cover,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(
                                                              16.0)),
                                                  clipBehavior: Clip.hardEdge,
                                                ),
                                              ),
                                            ),
                                      Container(
                                        height: 115.0,
                                        width: 115.0,
                                        child: Card(
                                          clipBehavior: Clip.antiAlias,
                                          child: AspectRatio(
                                            aspectRatio: 1.0,
                                            child: IconButton(
                                              onPressed: _getImage,
                                              icon: Icon(
                                                widget.employee == null ? Icons.person_add_alt : null,
                                                color: primaryColor
                                                    .withOpacity(0.5),
                                              ),
                                              padding: EdgeInsets.all(30.0),
                                              splashColor: Colors.transparent,
                                              highlightColor: greyColor,
                                              iconSize: 30.0,
                                            ),
                                          ),
                                          color: Colors.transparent,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(16.0)),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 8.0, bottom: 0.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Container(
                                            height: 50.0,
                                            child: FormBuilderTextField(
                                              name: 'name',
                                              controller: _nameController,
                                              textInputAction:
                                                  TextInputAction.next,
                                              decoration: InputDecoration(
                                                contentPadding: EdgeInsets.only(
                                                    left: 12.0, top: 0.0),
                                                labelText: '성명',
                                                labelStyle: TextStyle(
                                                    fontSize: 12.0,
                                                    color: Colors.black87),
                                                filled: true,
                                                fillColor: Colors.white,
                                                border: _border,
                                                focusedBorder: _border,
                                                enabledBorder: _border,
                                              ),
                                              validator: FormBuilderValidators
                                                  .compose([
                                                FormBuilderValidators.required(
                                                    context,
                                                    errorText: '이름은 필수입니다')
                                              ]),
                                              // onChanged: (name) {
                                              //   _nameController?.text =
                                              //       name ?? '';
                                              // },
                                              onSaved: (name) {
                                                _name = name;
                                              },
                                            ),
                                          ),
                                          // SizedBox(height: 7.0),
                                          Container(
                                            height: 54.0,
                                            child: FormBuilderDropdown(
                                              name: 'role',
                                              initialValue:
                                                  widget.employee == null
                                                      ? _role
                                                      : widget.employee!.role,
                                              decoration: InputDecoration(
                                                contentPadding: EdgeInsets.only(
                                                    left: 12.0, top: 0.0),
                                                labelText: '역할',
                                                labelStyle: TextStyle(
                                                    fontSize: 12.0,
                                                    color: Colors.black87),
                                                filled: true,
                                                fillColor: Colors.white,
                                                border: _border,
                                                focusedBorder: _border,
                                                enabledBorder: _border,
                                              ),
                                              // initialValue: 'Web',
                                              items: roles
                                                  .map((role) =>
                                                      DropdownMenuItem(
                                                          value: role,
                                                          child: Text(
                                                            '$role',
                                                            style: TextStyle(
                                                                fontSize: 14.0),
                                                          )))
                                                  .toList(),
                                              validator: FormBuilderValidators
                                                  .compose([
                                                FormBuilderValidators.required(
                                                    context,
                                                    errorText: '역할은 필수입니다')
                                              ]),
                                              onSaved: (role) {
                                                _role = role.toString();
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 3.0,
                            ),
                            Container(
                              height: 55.0,
                              width: double.infinity,
                              padding: EdgeInsets.only(left: 3.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: FormBuilderDateTimePicker(
                                      name: 'startDate',
                                      initialValue: widget.employee == null
                                          ? DateTime.now()
                                          // ? DateTime.parse('2021-04-01')
                                          : widget.employee!.startDate!
                                              .toDate(),
                                      textInputAction: TextInputAction.next,
                                      inputType: InputType.date,
                                      decoration: InputDecoration(
                                          prefixIcon:
                                              Icon(Icons.calendar_today),
                                          contentPadding:
                                              EdgeInsets.only(top: 0.0),
                                          labelText: '입사일자',
                                          labelStyle: TextStyle(
                                              fontSize: 12.0,
                                              color: Colors.black87),
                                          filled: true,
                                          fillColor: Colors.white,
                                          border: _border,
                                          focusedBorder: _border,
                                          enabledBorder: _border),
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(
                                          _startDate!.toDate().year,
                                          _startDate!.toDate().month - 6,
                                          _startDate!.toDate().day),
                                      lastDate: DateTime(
                                          _startDate!.toDate().year + 10,
                                          _startDate!.toDate().month,
                                          _startDate!.toDate().day),
                                      format: DateFormat('yyyy-MM-dd'),
                                      validator: FormBuilderValidators.compose([
                                        FormBuilderValidators.required(context,
                                            errorText: '입사일자는 필수입니다')
                                      ]),
                                      onSaved: (date) {
                                        _startDate = Timestamp.fromDate(
                                            date ?? DateTime.now());
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    width: 15.0,
                                  ),
                                  Expanded(
                                    child: FormBuilderTextField(
                                        name: 'careerYear',
                                        controller: _careerYearController,
                                        textInputAction: TextInputAction.next,
                                        // keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                            contentPadding: EdgeInsets.only(
                                                left: 11.0, top: 0.0),
                                            labelText: '경력(년)',
                                            labelStyle: TextStyle(
                                                fontSize: 12.0,
                                                color: Colors.black87),
                                            filled: true,
                                            fillColor: Colors.white,
                                            border: _border,
                                            focusedBorder: _border,
                                            enabledBorder: _border),
                                        validator:
                                            FormBuilderValidators.compose(
                                          [
                                            FormBuilderValidators.required(
                                                context,
                                                errorText: '경력(년수)는 필수입니다'),
                                            FormBuilderValidators.numeric(
                                                context,
                                                errorText: '숫자만 입력 가능합니다')
                                          ],
                                        ),
                                        // onChanged: (career) {
                                        //   _careerYearController?.text =
                                        //       career.toString();
                                        // },
                                        onSaved: (career) {
                                          if (career!.isEmpty) {
                                            career = '0.0';
                                          }
                                          _careerYear = double.parse(career);
                                        }),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 4.0,
                            ),
                            Container(
                                height: 50.0,
                                padding: EdgeInsets.only(left: 5.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: FormBuilderTextField(
                                        name: 'pay',
                                        controller: _payController,
                                        textInputAction: TextInputAction.next,
                                        keyboardType: TextInputType.number,
                                        textAlign: TextAlign.right,
                                        decoration: InputDecoration(
                                            labelText: '급여',
                                            labelStyle: TextStyle(
                                                fontSize: 12.0,
                                                color: Colors.black87),
                                            filled: true,
                                            fillColor: Colors.white,
                                            border: _border,
                                            focusedBorder: _border,
                                            enabledBorder: _border),
                                        validator:
                                            FormBuilderValidators.compose([
                                          FormBuilderValidators.required(
                                              context,
                                              errorText: '급여는 필수입니다'),
                                          FormBuilderValidators.numeric(context,
                                              errorText: '숫자만 입력 가능합니다')
                                        ]),
                                        // onChanged: (pay) {
                                        //   _payController?.text = pay.toString();
                                        // },
                                        onSaved: (pay) {
                                          if (pay!.isEmpty) {
                                            pay = '0';
                                          }
                                          _pay = int.parse(pay);
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      width: 15.0,
                                    ),
                                    Expanded(
                                      child: FormBuilderTextField(
                                        enabled: false,
                                        name: 'unit',
                                        // controller: _unitController,
                                        textInputAction: TextInputAction.next,
                                        textAlign: TextAlign.center,
                                        decoration: InputDecoration(
                                          labelText: 'IDR',
                                          labelStyle: TextStyle(
                                              fontSize: 12.0,
                                              color: Colors.black87),
                                          filled: true,
                                          fillColor:
                                          Colors.grey.withOpacity(0.1),
                                          disabledBorder: _border,
                                        ),
                                        // onChanged: (unit) {
                                        //   _unitController?.text =
                                        //       unit.toString();
                                        // },
                                        onSaved: (String? newUnit) {
                                          if (newUnit == null || newUnit.isEmpty) {
                                            _unit = 'IDR';
                                          }else {
                                            _unit = newUnit;
                                          }
                                        },
                                      ),
                                    ),
                                    // Expanded(
                                    //   child: FormBuilderDropdown(
                                    //     name: 'unit',
                                    //     initialValue: widget.employee == null
                                    //         ? _unit
                                    //         : widget.employee!.unit,
                                    //     decoration: InputDecoration(
                                    //       filled: true,
                                    //       fillColor: Colors.white,
                                    //       border: _border,
                                    //       focusedBorder: _border,
                                    //       enabledBorder: _border,
                                    //     ),
                                    //     items: ['IDR', 'WON']
                                    //         .map((unit) => DropdownMenuItem(
                                    //             value: unit,
                                    //             child: Text(
                                    //               '$unit',
                                    //               style:
                                    //                   TextStyle(fontSize: 11.0),
                                    //             )))
                                    //         .toList(),
                                    //     onSaved: (unit) {
                                    //       _unit = (unit ?? 'IDR').toString();
                                    //     },
                                    //   ),
                                    // )
                                  ],
                                )),
                            SizedBox(
                              height: 7.0,
                            ),
                            Container(
                              height: 50.0,
                              padding: EdgeInsets.only(left: 5.0),
                              child: FormBuilderTextField(
                                name: 'skillSet',
                                controller: _skillSetController,
                                textInputAction: TextInputAction.next,
                                decoration: InputDecoration(
                                    labelText: '보유기술',
                                    labelStyle: TextStyle(
                                        fontSize: 12.0, color: Colors.black87),
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: _border,
                                    focusedBorder: _border,
                                    enabledBorder: _border),
                                validator: FormBuilderValidators.compose([
                                  FormBuilderValidators.required(context,
                                      errorText: '보유기술은 필수입니다'),
                                ]),
                                // onChanged: (skillSet) {
                                //   _skillSetController?.text = skillSet ?? '';
                                // },
                                onSaved: (skillSet) {
                                  _skillSet = skillSet;
                                },
                              ),
                            ),
                            SizedBox(
                              height: 7.0,
                            ),
                            Container(
                              height: 50.0,
                              padding: EdgeInsets.only(left: 5.0),
                              child: FormBuilderTextField(
                                name: 'cellNo',
                                controller: _cellNoController,
                                textInputAction: TextInputAction.next,
                                decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.phone),
                                    labelText: '핸드폰',
                                    labelStyle: TextStyle(
                                        fontSize: 12.0, color: Colors.black87),
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: _border,
                                    focusedBorder: _border,
                                    enabledBorder: _border),
                                validator: FormBuilderValidators.compose([
                                  FormBuilderValidators.required(context,
                                      errorText: '핸드폰 번호는 필수입니다')
                                ]),
                                // onChanged: (cellNo) {
                                //   _cellNoController?.text = cellNo ?? '';
                                // },
                                onSaved: (cellNo) {
                                  _cellNo = cellNo;
                                },
                              ),
                            ),
                            ButtonBar(
                              children: [
                                ElevatedButton.icon(
                                    onPressed: () {
                                      if (_fbKey1.currentState!
                                          .saveAndValidate()) {
                                        // setState(() {}); // 중요
                                        _pageController!.jumpToPage(1);
                                        _page = _pageController!.page!;
                                        //'Next' 버튼 클릭 시에만 '저장'버튼 활성화
                                        setState(() {
                                          // _isSaved=true;
                                        });
                                      } else {
                                        print('입력되지 않은 항목이 있습니다');
                                      }
                                    },
                                    icon: Icon(Icons.navigate_next),
                                    label: Text('Next'))
                              ],
                            ),
                          ],
                        ),
                      ),
                      FormBuilder(
                          key: _fbKey2,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 5.0,
                              ),
                              Container(
                                height: 50.0,
                                child: FormBuilderTextField(
                                  name: 'email',
                                  controller: _emailController,
                                  textInputAction: TextInputAction.next,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.only(left: 1.0),
                                    prefixIcon: Icon(Icons.email),
                                    labelText: 'Email',
                                    labelStyle: TextStyle(
                                        fontSize: 12.0, color: Colors.black87),
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: _border,
                                    focusedBorder: _border,
                                    enabledBorder: _border,
                                  ),
                                  validator: FormBuilderValidators.compose([
                                    FormBuilderValidators.required(context,
                                        errorText: 'Email은 필수입니다'),
                                    FormBuilderValidators.email(context,
                                        errorText: 'Email을 확인하세요')
                                  ]),
                                  // onChanged: (email) {
                                  //   _emailController?.text = email ?? '';
                                  // },
                                  onSaved: (email) {
                                    _email = email;
                                  },
                                ),
                              ),
                              SizedBox(
                                height: 15.0,
                              ),
                              Container(
                                height: 50.0,
                                width: double.infinity,
                                padding: EdgeInsets.only(left: 5.0),
                                // color: Colors.blue,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: FormBuilderDateTimePicker(
                                        name: 'birthday',
                                        initialValue: widget.employee == null
                                            ? DateTime.now()
                                            : widget.employee!.birthday!
                                                .toDate(),
                                        textInputAction: TextInputAction.next,
                                        inputType: InputType.date,
                                        decoration: InputDecoration(
                                            contentPadding:
                                                EdgeInsets.only(top: 0.0),
                                            prefixIcon:
                                                Icon(Icons.calendar_today),
                                            labelText: '생년월일',
                                            labelStyle: TextStyle(
                                                fontSize: 12.0,
                                                color: Colors.black87),
                                            filled: true,
                                            fillColor: Colors.white,
                                            border: _border,
                                            focusedBorder: _border,
                                            enabledBorder: _border),
                                        initialDate: _startDate!.toDate(),
                                        firstDate: DateTime(1970, 1, 1),
                                        lastDate: DateTime(
                                            _startDate!.toDate().year + 10,
                                            _startDate!.toDate().month,
                                            _startDate!.toDate().day),
                                        format: DateFormat('yyyy-MM-dd'),
                                        validator:
                                            FormBuilderValidators.compose([
                                          FormBuilderValidators.required(
                                              context,
                                              errorText: '생년월일은 필수입니다')
                                        ]),
                                        onSaved: (birthday) {
                                          _birthday = Timestamp.fromDate(
                                              birthday ?? DateTime.now());
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      width: 15.0,
                                    ),
                                    Expanded(
                                      child: FormBuilderDropdown(
                                        name: 'marriage',
                                        initialValue: widget.employee == null
                                            ? _marriage
                                            : widget.employee!.marriage,
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.only(
                                              left: 12.0, top: 0.0),
                                          filled: true,
                                          fillColor: Colors.white,
                                          border: _border,
                                          focusedBorder: _border,
                                          enabledBorder: _border,
                                        ),
                                        items: ['미혼', '기혼']
                                            .map((unit) => DropdownMenuItem(
                                                value: unit,
                                                child: Text(
                                                  '$unit',
                                                  style:
                                                      TextStyle(fontSize: 12.0),
                                                )))
                                            .toList(),
                                        onSaved: (marriage) {
                                          _marriage =
                                              (marriage ?? '미혼').toString();
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
                                height: 50.0,
                                padding: EdgeInsets.only(left: 5.0),
                                child: FormBuilderTextField(
                                  name: 'familyHistory',
                                  controller: _familyHistoryController,
                                  textInputAction: TextInputAction.next,
                                  decoration: InputDecoration(
                                      labelText: '가족사항',
                                      labelStyle: TextStyle(
                                          fontSize: 12.0,
                                          color: Colors.black87),
                                      filled: true,
                                      fillColor: Colors.white,
                                      border: _border,
                                      focusedBorder: _border,
                                      enabledBorder: _border),
                                  // onChanged: (familyHistory) {
                                  //   _familyHistoryController?.text =
                                  //       familyHistory ?? '';
                                  // },
                                  onSaved: (familyHistory) {
                                    _familyHistory = familyHistory;
                                  },
                                ),
                              ),
                              SizedBox(
                                height: 15.0,
                              ),
                              Container(
                                height: 50.0,
                                width: double.infinity,
                                padding: EdgeInsets.only(left: 5.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: FormBuilderTextField(
                                        name: 'bankName',
                                        controller: _bankNameController,
                                        textInputAction: TextInputAction.next,
                                        decoration: InputDecoration(
                                          labelText: '은행명',
                                          labelStyle: TextStyle(
                                              fontSize: 12.0,
                                              color: Colors.black87),
                                          filled: true,
                                          fillColor: Colors.white,
                                          border: _border,
                                          focusedBorder: _border,
                                          enabledBorder: _border,
                                        ),
                                        // onChanged: (bankName) {
                                        //   _bankNameController?.text =
                                        //       bankName ?? '';
                                        // },
                                        onSaved: (bankName) {
                                          _bankName = bankName;
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      width: 15.0,
                                    ),
                                    Expanded(
                                      child: FormBuilderTextField(
                                        name: 'bankAccount',
                                        controller: _bankAccountController,
                                        textInputAction: TextInputAction.next,
                                        decoration: InputDecoration(
                                            contentPadding:
                                                EdgeInsets.only(left: 2.0),
                                            labelText: '계좌번호',
                                            labelStyle: TextStyle(
                                                fontSize: 12.0,
                                                color: Colors.black87),
                                            filled: true,
                                            fillColor: Colors.white,
                                            border: _border,
                                            focusedBorder: _border,
                                            enabledBorder: _border),
                                        // onChanged: (bankAccount) {
                                        //   _bankAccountController?.text =
                                        //       bankAccount ?? '';
                                        // },
                                        onSaved: (bankAccount) {
                                          _bankAccount = bankAccount;
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 15.0,
                              ),
                              Container(
                                height: 50.0,
                                padding: EdgeInsets.only(left: 5.0),
                                child: FormBuilderTextField(
                                  name: 'remark',
                                  controller: _remarkController,
                                  textInputAction: TextInputAction.done,
                                  decoration: InputDecoration(
                                      labelText: '비고',
                                      labelStyle: TextStyle(
                                          fontSize: 12.0,
                                          color: Colors.black87),
                                      filled: true,
                                      fillColor: Colors.white,
                                      border: _border,
                                      focusedBorder: _border,
                                      enabledBorder: _border),
                                  // onChanged: (remark) {
                                  //   _remarkController?.text = remark ?? '';
                                  // },
                                  onSaved: (remark) {
                                    _remark = remark;
                                  },
                                ),
                              ),
                              ButtonBar(
                                children: [
                                  ElevatedButton.icon(
                                      onPressed: () {
                                        _pageController!.jumpToPage(0);
                                        _page = _pageController!.page!;
                                        setState(() {});
                                      },
                                      icon: Icon(Icons.navigate_before),
                                      label: Text('Previous')),
                                  ElevatedButton(
                                      onPressed: employeeList!.loading!
                                          ? null
                                          : () {
                                              if (_fbKey2.currentState!
                                                  .saveAndValidate()) {
                                                _submit(widget.employee == null
                                                    ? 'Add'
                                                    : 'Edit');
                                              }
                                            },
                                      child: Text('저장'))
                                ],
                              )
                            ],
                          )),
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }
}
