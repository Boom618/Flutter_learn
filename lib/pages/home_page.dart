import 'package:flutter/material.dart';
import 'package:started_flutter/dao/home_dao.dart';
import 'package:started_flutter/dao/login_dao.dart';
import 'package:started_flutter/util/navigator_util.dart';
import 'package:started_flutter/widget/loading_container.dart';

import '../model/home_model.dart';
import '../widget/banner_widget.dart';
import '../widget/local_nav_widget.dart';

class HomePage extends StatefulWidget {
  static Config? configModel;

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

/// AutomaticKeepAliveClientMixin 页面常驻内存
class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  // 滚动距离
  static const appbarScrollOffset = 100;

  List<CommonModel> localNavList = [];
  List<CommonModel> bannerList = [];
  List<CommonModel> subNavList = [];
  GridNav? gridNavModel;
  SalesBox? salesBoxModel;

  bool _isLoading = true;

  /// bar 透明度
  double appBarAlpha = 0;

  get _logoutBtn => ElevatedButton(
        onPressed: () => {LoginDao.logOut()},
        child: const Text("登出"),
      );

  /// Opacity：它的作用是给子组件添加一个透明度的属性
  /// Container：容器,它可以容纳其它的 widget.
  get _appBar => Opacity(
        opacity: appBarAlpha,
        child: Container(
          padding: EdgeInsets.only(top: 20), // 适配手机 top 
          height: 80,

          /// BoxDecoration 装饰器
          decoration: const BoxDecoration(color: Colors.green),

          /// Center Center 继承自Align，只不过是将alignment设置为Alignment.center
          child: const Center(
            // Padding  的类型为 EdgeInsetsGeometry 基本上需要间距的地方，它都能够使用
            child: Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text("首页"),
            ),
          ),
        ),
      );

  get _listView => ListView(
        children: [
          BannerWidget(bannerList: bannerList),
          LocalNavWidget(localNavList: localNavList),
          _logoutBtn,
          Text(gridNavModel?.flight?.item1?.title ?? "---"),
          const SizedBox(
            height: 1000,
            child: ListTile(
              title: Text("hahhahh"),
            ),
          )
        ],
      );

  get _contentView => MediaQuery.removePadding(
      removeTop: true,
      context: context,
      // RefreshIndicator 监听刷新
      child: RefreshIndicator(
        color: Colors.blue,
        onRefresh: _handleRefresh,
        // NotificationListener 监听滚动状态
        child: NotificationListener(
          child: _listView,
          onNotification: (scrollNotification) {
            if (scrollNotification is ScrollUpdateNotification &&
                scrollNotification.depth == 0) {
              // 深度为 0 时，即 ListView 滚动
              // scrollNotification.metrics.pixels 获取滚动距离
              _onScroll(scrollNotification.metrics.pixels);
            }
            // 只监听，不消费事件
            return false;
          },
        ),
      ));

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
      body: LoadingContainer(
          child: Stack(
            children: [
              // MediaQuery.removePadding 移除 控件 padding
              _contentView,
              _appBar,
            ],
          ),
          isLoading: _isLoading),
    );
  }

  // 保持页面不销毁，常驻内存
  @override
  bool get wantKeepAlive => true;

  var bodString = "";

  ///  拉取首页接口数据
  Future<void> _handleRefresh() async {
    try {
      HomeModel model = await HomeDao.featch();
      setState(() {
        HomePage.configModel = model.config;

        localNavList = model.localNavList ?? [];
        subNavList = model.subNavList ?? [];
        gridNavModel = model.gridNav;
        salesBoxModel = model.salesBox;
        bannerList = model.bannerList ?? [];
        _isLoading = false;
      });
    } catch (e) {
      debugPrint(e.toString());
      setState(() {
        bodString = e.toString();
        _isLoading = false;
      });
    }
  }

  void _onScroll(double pixels) {
    print("pixels = $pixels");
    double alpha = pixels / appbarScrollOffset;

    if (alpha < 0) {
      alpha = 0;
    } else if (alpha > 1) {
      alpha = 1;
    }
    setState(() {
      appBarAlpha = alpha;
    });
  }
}
