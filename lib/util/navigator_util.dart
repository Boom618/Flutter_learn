import 'package:flutter/material.dart';
import 'package:started_flutter/pages/home_page.dart';

import '../pages/login_page.dart';

/// 导航
class NavigatorUtil {
  ///用于在获取不到context的地方，如dao中跳转页面时使用，需要在TabNavigator赋值
  ///注意：若TabNavigator被销毁，_context将无法使用
  static BuildContext? _context;

  static updateContext(BuildContext context) {
    NavigatorUtil._context = context;
    print('init:$context');
  }

  // 跳转到指定页
  static push(BuildContext context, Widget widget) {
    // 固定写法
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
  }

  // 跳转到首页
  static pushHome(BuildContext context) {
    // 跳转到首页 不让返回
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const HomePage()));
  }

  // 跳转到登录页
  static pushLogin() {
    Navigator.pushReplacement(
        _context!, MaterialPageRoute(builder: (context) => const LoginPage()));
  }

  static void jumpH5({required url, required title, required hideAppBar}) {

  }
}
