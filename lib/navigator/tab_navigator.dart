import 'package:flutter/material.dart';
import 'package:started_flutter/pages/home_page.dart';
import 'package:started_flutter/pages/my_page.dart';
import 'package:started_flutter/pages/search_page.dart';

import '../list/expansion_tile_page.dart';
import '../list/gridview_page.dart';
import '../list/refresh_loadmore_page.dart';
import '../pages/travel_page.dart';
import '../util/navigator_util.dart';

///首页底部导航器
class TabNavigator extends StatefulWidget {
  const TabNavigator({Key? key}) : super(key: key);

  @override
  State<TabNavigator> createState() => _TabNavigatorState();
}

class _TabNavigatorState extends State<TabNavigator> {
  final PageController _controller = PageController(initialPage: 0);
  final _defaultColor = Colors.grey;
  final _activeColor = Colors.blue;
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    //更新导航器的context，供退出登录时使用
    NavigatorUtil.updateContext(context);
    return Scaffold(
      body: PageView(
        controller: _controller,
        // physics: const NeverScrollableScrollPhysics(),
        children: const [
          HomePage(),
          // ExpansionTilePage(),
          // GridViewPage(),
          // RefreshLoadMorePage(),
          SearchPage(hideLeft: true,),
          TravelPage(),
          MyPage()
        ],
      ),
      // 底部导航栏
      bottomNavigationBar: BottomNavigationBar(
        //fixedColor 设置底部文字的颜色
        fixedColor: Colors.blue,
        currentIndex: _currentIndex,
        onTap: (index) {
          // jumpToPage 跳转不同的页面
          _controller.jumpToPage(index);
          setState(() {
            // 改变当前选中的 index
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        // 底部样式
        items: [
          _bottomItem('首页', Icons.home),
          _bottomItem('搜索', Icons.search),
          _bottomItem('旅拍', Icons.camera_alt),
          _bottomItem('我的', Icons.account_circle),
        ],
      ),
    );
  }

  _bottomItem(String title, IconData icon) {
    return BottomNavigationBarItem(
        icon: Icon(icon, color: _defaultColor),
        activeIcon: Icon(
          icon,
          color: _activeColor,
        ),
        label: title);
  }
}
