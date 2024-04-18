import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:started_flutter/mvvm/main/controllers/controller.dart';

import '../../../pages/home_page.dart';
import '../../../pages/my_page.dart';
import '../../../pages/search_page.dart';
import '../../../pages/travel_page.dart';

/// 首页底部导航器
class BottomTabView extends GetView<MainViewModel>{
  final _defaultColor = Colors.grey;
  final _activeColor = Colors.blue;

  const BottomTabView({super.key});


  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
      body: PageView(
        controller: controller.controller,
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
        currentIndex: controller.currentIndex.value,
        onTap: controller.onBottomNavTap,
        type: BottomNavigationBarType.fixed,
        // 底部样式
        items: [
          _bottomItem('首页', Icons.home),
          _bottomItem('搜索', Icons.search),
          _bottomItem('旅拍', Icons.camera_alt),
          _bottomItem('我的', Icons.account_circle),
        ],
      ),
    ));
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