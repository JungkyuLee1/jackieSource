// import 'package:flutter/material.dart';
// import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
// import 'package:jackie_hr/providers/cost_provider.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:provider/provider.dart';
//
// class WelfareMainPage extends StatefulWidget {
//   // const WelfareMainPage({Key? key}) : super(key: key);
//
//   @override
//   _WelfareMainPageState createState() => _WelfareMainPageState();
// }
//
// class _WelfareMainPageState extends State<WelfareMainPage> {
//   String _userAccount = 'SIyR2LufGYMxdUt6WepgOj1Fdwv1';
//   var urlResult;
//   String? url;
//   bool loading = false;
//
//   showErrorDialog(String errMsg) {
//     showDialog(
//         context: context,
//         builder: (context) {
//           return AlertDialog(title: Text('에러'), content: Text(errMsg));
//         });
//   }
//
//   void launchInWebViewOrSafariVC({required String url}) async {
//     if (await canLaunch(url)) {
//       await launch(url, forceSafariVC: false, forceWebView: true);
//     } else {
//       showErrorDialog('앱 내에서 $url 홈페이지를 열수 없습니다');
//     }
//   }
//
//   @override
//   void initState() {
//     super.initState();
//
//     WidgetsBinding.instance!.addPostFrameCallback((_) async {
//       urlResult = await context.read<CostList>().getURL(_userAccount);
//
//       print('urlResult : ${urlResult[0]['url']}');
//       url = urlResult[0]['url'];
//
//       setState(() {
//         loading = true;
//       });
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return loading
//         ? WebviewScaffold(
//             url: url!,
//             withJavascript: true,
//             withLocalStorage: true,
//             withZoom: true,
//           )
//         : Container();
//   }
// }
