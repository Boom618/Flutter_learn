import 'package:flutter/material.dart';
import 'package:started_flutter/dao/home_dao.dart';
import 'package:started_flutter/dao/login_dao.dart';
import 'package:started_flutter/util/navigator_util.dart';
import 'package:started_flutter/widget/grid_nav_widget.dart';
import 'package:started_flutter/widget/loading_container.dart';
import 'package:started_flutter/widget/search_bar_widget.dart';

import '../model/home_model.dart';
import '../util/view_util.dart';
import '../widget/banner_widget.dart';
import '../widget/local_nav_widget.dart';
import '../widget/sub_nav_widget.dart';
import 'search_page.dart';

const searchBarDefaultText = '网红打开地 景点 酒店 美食';

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
  get _appBar {
    // 计算安全边界 适配刘海屏
    double top = MediaQuery.of(context).padding.top;
    return Column(
      children: [
        shadowWarp(
          child: Container(
            height: 60 + top, // 搜索框 + top
            padding: EdgeInsets.only(top: top),
            decoration: BoxDecoration(
              color: Color.fromARGB((appBarAlpha * 255).toInt(), 255, 255, 255),
            ),
            child: SearchBarWidget(
              searchBarType: appBarAlpha > 0.2
                  ? SearchBarType.homeLight
                  : SearchBarType.home,
              inputBoxClick: _jumpToSearch, // 点击输入框 event
              defaultText: searchBarDefaultText,
              rightButtonClick: () {
                LoginDao.logOut();
              },
            ),
          ),
        ),
        // 底部线
        Container(
          height: appBarAlpha > 0.2 ? 0.5 : 0,
          decoration: const BoxDecoration(
              boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 0.5)]),
        )
      ],
    );
  }

  get _listView => ListView(
        children: [
          BannerWidget(bannerList: bannerList),
          LocalNavWidget(localNavList: localNavList),
          // 网格布局
          if (gridNavModel != null) GridNavWidget(gridNavModel: gridNavModel!),
          SubNavWidget(suNavList: subNavList),
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
          isLoading: _isLoading,
          child: Stack(
            children: [
              // MediaQuery.removePadding 移除 控件 padding
              _contentView,
              _appBar,
            ],
          )),
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

  void _jumpToSearch() {
    NavigatorUtil.push(context, const SearchPage());
  }
}
