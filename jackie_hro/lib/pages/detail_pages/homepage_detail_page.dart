import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomePageDetailPage extends StatefulWidget {
  // const HomePageDetailPage({Key? key}) : super(key: key);
  final String url;

  HomePageDetailPage({required this.url});

  @override
  State<HomePageDetailPage> createState() => _HomePageDetailPageState();
}

class _HomePageDetailPageState extends State<HomePageDetailPage> {
  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SellOn'),
      ),
      body: WebView(
        initialUrl: widget.url,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}

//
//     url: widget.url,
//     // withLocalUrl: true,
//     appBar: AppBar(
//       title: Text('SellOn'),
//     ),
//     withJavascript: true,
//     withLocalStorage: true,
//     withZoom: true,
//     clearCache: true,
//     clearCookies: true,
//     appCacheEnabled: true,
//   );
// }
// }

// import 'package:flutter/material.dart';
// import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
//
// class HomePageDetailPage extends StatelessWidget {
//   // const HomePageDetailPage({Key? key}) : super(key: key);
//   final String url;
//   HomePageDetailPage({required this.url});
//
//   @override
//   Widget build(BuildContext context) {
//     return WebviewScaffold(
//       url: url,
//       // withLocalUrl: true,
//       appBar: AppBar(
//         title: Text('SellOn'),
//       ),
//       withJavascript: true,
//       withLocalStorage: true,
//       withZoom: true,
//       clearCache: true,
//       clearCookies: true,
//       appCacheEnabled: true,
//     );
//   }
// }
