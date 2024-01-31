import 'package:flutter/material.dart';
import 'package:jackie_hr/pages/detail_pages/homepage_detail_page.dart';
import 'package:jackie_hr/pages/master_pages/hr_master_page.dart';
import 'package:jackie_hr/providers/cost_provider.dart';
import 'package:provider/provider.dart';

class HomePageMain extends StatefulWidget {
  const HomePageMain({Key? key}) : super(key: key);

  @override
  _HomePageMainState createState() => _HomePageMainState();
}

class _HomePageMainState extends State<HomePageMain> {
  String _userAccount = 'SIyR2LufGYMxdUt6WepgOj1Fdwv1';
  bool loading = false;

  showErrorDialog(String errMsg) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(title: Text('에러'), content: Text(errMsg));
        });
  }

  openPage(String url) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => HomePageDetailPage(
                  url: url,
                ))).then((_) => Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => HrMasterPage(selectedPage: 0)),
        (route) => false));
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      final urlResult = await context.read<CostList>().getURL(_userAccount);
      final url = urlResult[0]['url'];

      if(mounted) {
        openPage(url);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
