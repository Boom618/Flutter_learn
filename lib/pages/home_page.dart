import 'package:flutter/material.dart';
import 'package:started_flutter/dao/login_dao.dart';
import 'package:started_flutter/util/navigator_util.dart';

import '../model/home_model.dart';
import '../widget/banner_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

/// AutomaticKeepAliveClientMixin 页面常驻内存
class _HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin{


  List<CommonModel> bannerList = [CommonModel(),CommonModel(),CommonModel(),CommonModel()];

  get _logoutBtn => ElevatedButton(
        onPressed: () => {LoginDao.logOut()},
        child: const Text("登出"),
      );

  //
  @override
  void initState() {
    super.initState();
    _handleRefresh();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    NavigatorUtil.updateContext(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("首页"),
        actions: [_logoutBtn],
      ),
      body: Column(
        children: [
          BannerWidget(bannerList:bannerList)
        ],
      ),
    );
  }

  // 保持页面不销毁，常驻内存
  @override
  bool get wantKeepAlive => true;

  /// 轮播图
  _handleRefresh(){

  }
}
