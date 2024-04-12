import 'package:flutter/material.dart';
import 'package:started_flutter/dao/login_dao.dart';
import 'package:started_flutter/util/navigator_util.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

/// AutomaticKeepAliveClientMixin 页面常驻内存
class _HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin{
  get _logoutBtn => ElevatedButton(
        onPressed: () => {LoginDao.logOut()},
        child: const Text("登出"),
      );

  @override
  Widget build(BuildContext context) {
    super.build(context);
    NavigatorUtil.updateContext(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("首页"),
        actions: [_logoutBtn],
      ),
    );
  }

  // 保持页面不销毁，常驻内存
  @override
  bool get wantKeepAlive => true;
}
