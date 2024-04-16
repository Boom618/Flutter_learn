import 'package:flutter/material.dart';
import 'package:started_flutter/widget/hi_webview.dart';

/// 我的页面
class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> with AutomaticKeepAliveClientMixin{
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: HiWebView(
        url: 'https://m.ctrip.com/webapp/myctrip/',
        hideAppBar: true,
        backForbid: true,
        statusBarColor: '4c5bca',
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
