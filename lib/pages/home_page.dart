import 'package:flutter/material.dart';
import 'package:started_flutter/dao/login_dao.dart';
import 'package:started_flutter/util/navigator_util.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  get _logoutBtn => ElevatedButton(
        onPressed: () => {LoginDao.logOut()},
        child: const Text("登出"),
      );

  @override
  Widget build(BuildContext context) {
    NavigatorUtil.updateContext(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("首页"),
        actions: [_logoutBtn],
      ),
    );
  }
}
