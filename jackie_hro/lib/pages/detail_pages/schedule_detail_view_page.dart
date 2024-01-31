import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jackie_hr/constants/user_account.dart';
import 'package:jackie_hr/models/customer_error.dart';
import 'package:jackie_hr/pages/detail_pages/schedule_addedit_page.dart';
import 'package:jackie_hr/pages/master_pages/hr_master_page.dart';
import 'package:jackie_hr/providers/schedule/dev_filter_provider.dart';
import 'package:jackie_hr/providers/schedule/dev_ongoing_count_state.dart';
import 'package:jackie_hr/providers/schedule/dev_search_provider.dart';
import 'package:jackie_hr/providers/schedule/schedule_provider.dart';
import 'package:jackie_hr/providers/schedule/schedule_state.dart';
import 'package:jackie_hr/widgets/error_dialog.dart';
import 'package:provider/provider.dart';

import '../../models/schedule_model.dart';

class ScheduleDetailViewPage extends StatefulWidget {
  const ScheduleDetailViewPage({Key? key}) : super(key: key);

  @override
  _ScheduleDetailViewPageState createState() => _ScheduleDetailViewPageState();
}

class _ScheduleDetailViewPageState extends State<ScheduleDetailViewPage> {
  Size? size;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Column(
            children: [
              Header(),
              SizedBox(
                height: 20,
              ),
              SearchAndFilter(),
              ScheduleHeader(widthSize: size!.width),
              SizedBox(
                height: 10,
              ),
              ShowSchedule(widthSize: size!.width),
            ],
          ),
        ),
      ),
    );
  }
}

//1 Header
class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '개발 진행 상태',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Text(
          '${context.watch<DevOngoingCountState>().count}개 항목 진행 중..',
          style: TextStyle(fontSize: 13, color: Colors.red),
        ),
      ],
    );
  }
}

//2 검색
class SearchAndFilter extends StatefulWidget {
  const SearchAndFilter({Key? key}) : super(key: key);

  @override
  _SearchAndFilterState createState() => _SearchAndFilterState();
}

class _SearchAndFilterState extends State<SearchAndFilter> {
  OutlineInputBorder _border = OutlineInputBorder(
      borderSide: BorderSide(width: 0.0, color: Colors.transparent),
      borderRadius: BorderRadius.circular(12.0));
  TextEditingController searchTermController = TextEditingController();
  bool controllerStatus = true; //최초 1회만 TextEditingController()를 생성하기 위함

  @override
  void dispose() {
    super.dispose();
    searchTermController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //상세화면 go->back 시 입력 된 검색어를 유지하기 위함
    if (controllerStatus) {
      searchTermController.text = context.watch<DevSearchState>().searchTerm;
      controllerStatus = false;
    }
    return Column(
      children: [
        Container(
          height: 45,
          child: TextFormField(
            controller: searchTermController,
            autocorrect: false,
            textInputAction: TextInputAction.search,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 3),
                labelText: '제목 검색',
                border: _border,
                enabledBorder: _border,
                focusedBorder: _border,
                filled: true,
                fillColor: Colors.white,
                prefixIcon: Icon(Icons.search)),
            onChanged: (String? newSearchTerm) {
              if (newSearchTerm != null || newSearchTerm!.trim().isNotEmpty) {
                //검색어 Setting
                context
                    .read<DevSearchProvider>()
                    .setSearchTerm(newSearchTerm.trim());

                //검색어로 조회하기 위하여 Provider 호출 (update() 반영 및 조회 목적)
                WidgetsBinding.instance!.addPostFrameCallback((_) async {
                  await context
                      .read<ScheduleProvider>()
                      .getAllSchedule(userAccount: gUserAccount);
                });
                // setState(() {
                //
                // });
              }
            },
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FilterButton(filter: Filter.All),
            FilterButton(filter: Filter.Ongoing),
            FilterButton(filter: Filter.Completed)
          ],
        )
      ],
    );
  }
}

//2-1(FilterButton)
class FilterButton extends StatelessWidget {
  const FilterButton({required this.filter, Key? key}) : super(key: key);
  final Filter filter;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          context.read<DevFilterProvider>().changeFilter(filter);
          //조회 건 Provider 호출 (update() 반영 및 조회 목적)
          WidgetsBinding.instance!.addPostFrameCallback((_) async {
            await context
                .read<ScheduleProvider>()
                .getAllSchedule(userAccount: gUserAccount);

            //Focus 제거
            FocusScope.of(context).requestFocus(FocusNode());
          });
        },
        child: Text(
          filter == Filter.All
              ? '전체'
              : filter == Filter.Ongoing
                  ? '진행 중'
                  : '완료',
          style: TextStyle(
              fontSize: 16,
              color: textColor(context, filter),
              fontWeight: textFontWeight(context, filter)),
        ));
  }
}

//2-2(상태 Text Color)
Color textColor(BuildContext context, Filter filter) {
  final currentFilter = context.watch<DevFilterState>().filter;

  return currentFilter == filter ? Colors.blue : Colors.grey;
}

//2-3(상태 FontWeigh)
FontWeight textFontWeight(BuildContext context, Filter filter) {
  final currentFilter = context.watch<DevFilterState>().filter;

  return currentFilter == filter ? FontWeight.bold : FontWeight.normal;
}

//3 Schedule Header
class ScheduleHeader extends StatelessWidget {
  const ScheduleHeader({required this.widthSize, Key? key}) : super(key: key);
  final double widthSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
      decoration: BoxDecoration(color: Colors.grey[300]),
      child: SingleChildScrollView(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                child: Text(
                  'No',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontSize: 14, decoration: TextDecoration.underline),
                )),
            Spacer(flex: 2,),
            Container(
                child: Text('제목',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontSize: 14, decoration: TextDecoration.underline))),
            Spacer(flex: 6,),
            Container(
                child: Text('내용',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 14, decoration: TextDecoration.underline))),
            Spacer(flex: 8,),
            Container(
                child: Text('국가',
                    textAlign: TextAlign.end,
                    style: TextStyle(
                        fontSize: 14, decoration: TextDecoration.underline))),
            Spacer(flex: 1,),
            Container(
                child: Text('개발기간',
                    textAlign: TextAlign.end,
                    style: TextStyle(
                        fontSize: 14, decoration: TextDecoration.underline))),
          ],
        ),
      ),
    );
  }
}

//4 Schedule 전체 조회
class ShowSchedule extends StatefulWidget {
  const ShowSchedule({required this.widthSize, Key? key}) : super(key: key);
  final double widthSize;

  @override
  _ShowScheduleState createState() => _ShowScheduleState();
}

class _ShowScheduleState extends State<ShowSchedule> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      await context
          .read<ScheduleProvider>()
          .getAllSchedule(userAccount: gUserAccount);
    });
  }

  @override
  Widget build(BuildContext context) {
    final schedules = context.watch<ScheduleState>().schedules;

    return Expanded(
      child: ListView.separated(
          primary: false,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final schedule = schedules[index];

            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ScheduleAddEditPage(
                              scheduleModel: schedule,
                            ))).then((_) {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HrMasterPage(selectedPage: 2)),
                      (route) => false);
                });
              },
              child: Dismissible(
                key: UniqueKey(),
                onDismissed: (_) async {
                  try {
                    await context
                        .read<ScheduleProvider>()
                        .getRemoveSchedule(schedule);
                  } on CustomError catch (e) {
                    errorDialog(context, throw e);
                  }
                },
                confirmDismiss: (_) => confirmDismissible(context),
                background: showDismissibleBackground(0),
                secondaryBackground: showDismissibleBackground(1),
                child: ScheduleItem(
                  schedule: schedule,
                  num: index + 1,
                  widthSize: widget.widthSize,
                ),
              ),
            );
          },
          separatorBuilder: (context, index) => Divider(),
          itemCount: schedules.length),
    );
  }
}

//Dismissible part 1
Future<bool?> confirmDismissible(BuildContext context) {
  return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
            title: Text('확인'),
            content: Text('삭제하시겠습니까?'),
            actions: [
              TextButton(
                  onPressed: () => Navigator.pop(context, true),
                  child: Text('예')),
              TextButton(
                  onPressed: () => Navigator.pop(context, false),
                  child: Text('아니오')),
            ],
          ));
}

//Dismissible part 2
Widget showDismissibleBackground(int secondary) {
  return Container(
    margin: EdgeInsets.all(4),
    padding: EdgeInsets.symmetric(horizontal: 20),
    color: Colors.red,
    alignment: secondary == 0 ? Alignment.centerLeft : Alignment.centerRight,
    child: Icon(
      Icons.delete,
      size: 20,
      color: Colors.white,
    ),
  );
}

//4-1 Schedule 상세 Item
class ScheduleItem extends StatefulWidget {
  const ScheduleItem(
      {required this.schedule,
      required this.num,
      required this.widthSize,
      Key? key})
      : super(key: key);
  final ScheduleModel schedule;
  final int num;
  final widthSize;

  @override
  _ScheduleItemState createState() => _ScheduleItemState();
}

class _ScheduleItemState extends State<ScheduleItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            child: Text(
              widget.num.toString(),
              style: TextStyle(fontSize: 13, color: Colors.black87),
            ),
            radius: 10,
            backgroundColor: Colors.grey[400],
          ),
          SizedBox(
            width: 3,
          ),
          Container(
              width: widget.widthSize * 0.25,
              child: Text(
                widget.schedule.title,
                textAlign: TextAlign.start,
                overflow: TextOverflow.ellipsis,
              )),
          Container(
              width: widget.widthSize * 0.35,
              child: Text(
                widget.schedule.desc.substring(
                    0,
                    widget.schedule.desc.trim().length < 17
                        ? widget.schedule.desc.trim().length
                        : 17),
                textAlign: TextAlign.start,
                overflow: TextOverflow.ellipsis,
              )),
          Container(
              width: widget.widthSize * 0.07,
              child: Text(
                widget.schedule.nation,
                textAlign: TextAlign.end,
                overflow: TextOverflow.ellipsis,
              )),
          Container(
              width: widget.widthSize * 0.15,
              child: Text(
                widget.schedule.devStep == 0
                    ? '매우 시급'
                    : widget.schedule.devStep == 1
                        ? '2주일 내'
                        : '다음 버전',
                textAlign: TextAlign.end,
                overflow: TextOverflow.ellipsis,
              )),
        ],
      ),
    );
  }
}
