import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:jackie_hr/constants/user_account.dart';
import 'package:jackie_hr/models/customer_error.dart';
import 'package:jackie_hr/pages/master_pages/hr_master_page.dart';
import 'package:jackie_hr/providers/schedule/schedule_state.dart';
import 'package:jackie_hr/widgets/error_dialog.dart';
import 'package:provider/provider.dart';

import '../../models/schedule_model.dart';
import '../../providers/schedule/schedule_provider.dart';

class ScheduleAddEditPage extends StatefulWidget {
  // const ScheduleAddEditPage({Key? key}) : super(key: key);
  final ScheduleModel? scheduleModel;

  ScheduleAddEditPage({this.scheduleModel});

  @override
  _ScheduleAddEditPageState createState() => _ScheduleAddEditPageState();
}

class _ScheduleAddEditPageState extends State<ScheduleAddEditPage> {
  late TextEditingController titleController;
  late TextEditingController descriptionController;
  String? _title, _desc, _imageUrl, _videoUrl, _inputPassword;
  String _radioCompleteStatusValue = 'ongoing'; //미완료,
  String _nation = 'ALL';
  int _radioDevStageValue = 1; //2주일 내
  Timestamp _today = Timestamp.fromDate(DateTime.now());
  bool _nationFlag = false;
  bool _devCompleteStatusFlag = false;
  bool _devStageFlag = false;
  bool _isChanged = false;

  AutovalidateMode _autoValidateMode = AutovalidateMode.disabled;
  GlobalKey<FormState> _fKey = GlobalKey<FormState>();

  OutlineInputBorder _border = OutlineInputBorder(
      borderSide: BorderSide(width: 0.0, color: Colors.transparent),
      borderRadius: BorderRadius.circular(12.0));

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(
        text: widget.scheduleModel == null ? '' : widget.scheduleModel!.title);
    descriptionController = TextEditingController(
        text: widget.scheduleModel == null ? '' : widget.scheduleModel!.desc);
  }

  //Title&Description Input(1)
  Widget _titleAndDescription() {
    return Column(
      children: [
        TextFormField(
          controller: titleController,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            labelText: '제목',
            filled: true,
            fillColor: Colors.white,
            border: _border,
            enabledBorder: _border,
            focusedBorder: _border,
          ),
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return '제목을 입력하세요';
            }
            return null;
          },
          onChanged: (value) {
            setState(() {
              _isChanged = true;
            });
          },
          onSaved: (value) {
            _title = value!;
          },
        ),
        SizedBox(
          height: 10,
        ),
        TextFormField(
          controller: descriptionController,
          textInputAction: TextInputAction.newline,
          keyboardType: TextInputType.multiline,
          autocorrect: false,
          decoration: InputDecoration(
            alignLabelWithHint: true,
            labelText: '상세 설명',
            filled: true,
            fillColor: Colors.white,
            border: _border,
            enabledBorder: _border,
            focusedBorder: _border,
          ),
          maxLines: 11,
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return '상세 설명을 입력하세요';
            }
            return null;
          },
          onChanged: (value){
            setState(() {
              _isChanged = true;
            });
          },
          onSaved: (value) {
            _desc = value!;
          },
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }

  //대상 국가 선택
  Widget _nationButton() {
    List<String> _nations = ['ALL', 'SG', 'ID'];

    return FractionallySizedBox(
      alignment: Alignment.centerLeft,
      widthFactor: 0.2,
      child: Container(
        padding: EdgeInsets.only(left: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
        ),
        child: PopupMenuButton(
          // offset: Offset(0, 25),
          shape: ShapeBorder.lerp(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
              1),
          onSelected: (String value) {
            setState(() {
              _nation = value;
              _nationFlag = true;
              _isChanged=true;
              //저장 후 값 변(국가를 변경하고 1.완료여부 2.개발 구분을 변경 안할 경우는 DB Data 이용함 (322-327 라인)경)
              // _devCompleteStatusFlag = false;
              // _devStageFlag = false;

              // //전체 건 다시 (갱신)조회
              // context
              //     .read<ScheduleProvider>()
              //     .getAllSchedule(userAccount: gUserAccount);
            });
          },
          itemBuilder: (context) => _nations
              .map(
                  (nation) => PopupMenuItem(value: nation, child: Text(nation)))
              .toList(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.scheduleModel == null
                    ? _nation
                    : _nationFlag == false
                        ? widget.scheduleModel!.nation
                        : _nation,
                style: TextStyle(fontSize: 13),
              ),
              Icon(Icons.keyboard_arrow_down)
            ],
          ),
        ),
      ),
    );
  }

  //RadioButton 값 Setting(2-1)
  void _handleRadioCompleteYnValueChange(newValue) {
    setState(() {
      _radioCompleteStatusValue = newValue;
      _devCompleteStatusFlag = true;
      _isChanged=true;
      //전체 건 다시 (갱신)조회
      context
          .read<ScheduleProvider>()
          .getAllSchedule(userAccount: gUserAccount);
    });
  }

  //RadioButton 값 Setting(2-2)
  void _handleRadioDevStageChange(newValue) {
    setState(() {
      _radioDevStageValue = newValue;
      _devStageFlag = true;
      _isChanged=true;
      //전체 건 다시 (갱신)조회
      context
          .read<ScheduleProvider>()
          .getAllSchedule(userAccount: gUserAccount);
    });
  }

//Status Info(완료 여부, 예상 완료 시점)(2)
  Widget _statusInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 15,
        ),
        //완료 여부 RadioButton
        if (widget.scheduleModel != null) Text(' * 완료 여부'),
        if (widget.scheduleModel != null)
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Radio(
                  value: 'completed',
                  groupValue: widget.scheduleModel == null
                      ? _radioCompleteStatusValue
                      : _devCompleteStatusFlag == false
                          ? widget.scheduleModel!.completeStatus
                          : _radioCompleteStatusValue,
                  onChanged: _handleRadioCompleteYnValueChange),
              Text('완료'),
              SizedBox(width: 10),
              Radio(
                  value: 'ongoing',
                  groupValue: widget.scheduleModel == null
                      ? _radioCompleteStatusValue
                      : _devCompleteStatusFlag == false
                          ? widget.scheduleModel!.completeStatus
                          : _radioCompleteStatusValue,
                  onChanged: _handleRadioCompleteYnValueChange),
              Text('미완료'),
            ],
          ),
        if (widget.scheduleModel != null)
          SizedBox(
            height: 15,
          ),
        //개발 구분 Radio Button
        Text(' * 개발 구분'),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Radio(
                value: 0,
                groupValue: widget.scheduleModel == null
                    ? _radioDevStageValue
                    : _devStageFlag == false
                        ? widget.scheduleModel!.devStep
                        : _radioDevStageValue,
                onChanged: _handleRadioDevStageChange),
            Text('매우 시급'),
            SizedBox(width: 10),
            Radio(
                value: 1,
                groupValue: widget.scheduleModel == null
                    ? _radioDevStageValue
                    : _devStageFlag == false
                        ? widget.scheduleModel!.devStep
                        : _radioDevStageValue,
                onChanged: _handleRadioDevStageChange),
            Text('2주일 내'),
            SizedBox(width: 10),
            Radio(
                value: 2,
                groupValue: widget.scheduleModel == null
                    ? _radioDevStageValue
                    : _devStageFlag == false
                        ? widget.scheduleModel!.devStep
                        : _radioDevStageValue,
                onChanged: _handleRadioDevStageChange),
            Text('다음 버전'),
          ],
        ),
      ],
    );
  }

  //Save Button(3)
  Widget _saveButton() {
    return ButtonBar(
      children: [
        ElevatedButton(
            onPressed: () => context.read<ScheduleState>().scheduleStatus ==
                    ScheduleStatus.loading || !_isChanged
                ? null
                : _submit(widget.scheduleModel == null ? 'Add' : 'Edit'),
            style: ElevatedButton.styleFrom(primary: _isChanged ? Colors.red : Colors.grey),
            child: Text('저장')),
      ],
    );
  }

  //3-1
  void _submit(String mode) async {
    setState(() {
      _autoValidateMode = AutovalidateMode.always;
    });

    if (!_fKey.currentState!.validate()) return;
    _fKey.currentState!.save();

    if (mode == 'Add') {
      try {
        ScheduleModel newSchedule = ScheduleModel(
            title: _title!,
            desc: _desc!,
            imageUrl: _imageUrl ?? '',
            videoUrl: _videoUrl ?? '',
            completeStatus: _radioCompleteStatusValue,
            devStep: _radioDevStageValue,
            inputPassword: _inputPassword ?? '0000',
            nation: _nation,
            userAccount: gUserAccount,
            createDate: _today,
            updateDate: _today);

        await context.read<ScheduleProvider>().getAddSchedule(newSchedule);
        ScaffoldMessenger.of(context).showSnackBar(_snackBar);
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (context) => HrMasterPage(selectedPage: 2)),
            (route) => false);
      } on CustomError catch (e) {
        errorDialog(context, throw e);
      }
    } else {
      try {
        ScheduleModel updSchedule = ScheduleModel(
            id: widget.scheduleModel!.id,
            title: _title!,
            desc: _desc!,
            imageUrl: _imageUrl ?? '',
            videoUrl: _videoUrl ?? '',
            completeStatus: _devCompleteStatusFlag == false
                ? widget.scheduleModel!.completeStatus
                : _radioCompleteStatusValue,
            devStep: _devStageFlag == false
                ? widget.scheduleModel!.devStep
                : _radioDevStageValue,
            inputPassword: _inputPassword ?? '0000',
            nation: _nation,
            userAccount: widget.scheduleModel!.userAccount,
            createDate: widget.scheduleModel!.createDate,
            updateDate: _today);

        await context.read<ScheduleProvider>().getUpdateSchedule(updSchedule);
        ScaffoldMessenger.of(context).showSnackBar(_snackBar);
        Navigator.pop(context, true);
      } on CustomError catch (e) {
        errorDialog(context, throw e);
      }
    }
    _initializationAfterSave();
  }

  //3-2 (저장 후 초기화)
  void _initializationAfterSave() {
    setState(() {
      _autoValidateMode = AutovalidateMode.disabled;
      //Add 경우 초기화
      if (widget.scheduleModel == null) {
        _radioCompleteStatusValue = 'ongoing';
        _radioDevStageValue = 1;
      }
    });

    titleController.clear();
    descriptionController.clear();
    //Focus 제거
    FocusScope.of(context).requestFocus(FocusNode());
  }

  //3-3 저장후 결과 snackbar
  final _snackBar = SnackBar(
    content: Text(
      '저장 되었습니다',
      textAlign: TextAlign.center,
    ),
    duration: Duration(seconds: 2),
  );

  AppBar _appBar() {
    return AppBar(
      iconTheme: IconThemeData(
        color: widget.scheduleModel != null ? Colors.white : Colors.black87,
      ),
      title: Text(
        widget.scheduleModel == null ? '개발 일정 등록' : '개발 일정 수정',
        style: TextStyle(
            fontSize: 18,
            color:
                widget.scheduleModel == null ? Colors.black87 : Colors.white),
      ),
      backgroundColor: widget.scheduleModel == null
          ? Colors.grey[200]
          : Theme.of(context).primaryColor,
      elevation: 0,
      centerTitle: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          backgroundColor: Colors.grey[200],
          appBar: _appBar(),
          body: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  vertical: widget.scheduleModel == null ? 10 : 25,
                  horizontal: 20),
              child: Form(
                key: _fKey,
                autovalidateMode: _autoValidateMode,
                child: ListView(
                  children: [
                    _titleAndDescription(),
                    _nationButton(),
                    _statusInfo(),
                    _saveButton()
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
