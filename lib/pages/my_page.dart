import 'package:flutter/material.dart';
import 'package:started_flutter/widget/hi_webview.dart';

/// 我的页面
class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("我的"),
      ),
      body: HiWebView(url: 'https://m.ctrip.com/webapp/myctrip/',hideAppBar: true,),

    );
  }
}
