import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/route_manager.dart';
import 'package:started_flutter/navigator/tab_navigator.dart';
import 'package:started_flutter/pages/home_page.dart';

import '../pages/login_page.dart';
import '../widget/hi_webview.dart';

/// 导航
class NavigatorUtil {
  ///用于在获取不到context的地方，如dao中跳转页面时使用，需要在TabNavigator赋值
  ///注意：若TabNavigator被销毁，_context将无法使用
  static BuildContext? _context;

  static updateContext(BuildContext context) {
    NavigatorUtil._context = context;
    print('init:$context');
  }

  ///返回上一页
  static pop(BuildContext context) {
    // if (Navigator.canPop(context)) {
    //   Navigator.pop(context);
    // } else {
    //   //退出APP
    //   SystemNavigator.pop();
    // }
    Get.back();
  }

  // 跳转到指定页
  static push(BuildContext context, Widget page) {
    // 固定写法
    // Navigator.push(context, MaterialPageRoute(builder: (context) => page));
    // get 方式跳转
    Get.to(page);
  }

  // 跳转到首页
  static pushHome(BuildContext context) {
    // 跳转到首页 不让返回
    // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const TabNavigator()));
    Get.offAll(const TabNavigator()); // 关闭所有页面，跳转
  }

  // 跳转到登录页
  static pushLogin() {
    // Navigator.pushReplacement(_context!, MaterialPageRoute(builder: (context) => const LoginPage()));
    Get.off(const LoginPage()); // 关闭当前页面，跳转
  }

  ///跳转H5页面
  static jumpH5({BuildContext? context,
    String? url,
    String? title,
    bool? hideAppBar,
    String? statusBarColor}) {
    //   BuildContext? safeContext;
    //   if (url == null) {
    //     debugPrint('url is null jumpH5 failed.');
    //     return;
    //   }
    //   if (context != null) {
    //     safeContext = context;
    //   } else if (_context?.mounted ?? false) {
    //     safeContext = _context;
    //   } else {
    //     debugPrint('context is null jumpH5 failed.');
    //     return;
    //   }
    //   Navigator.push(
    //       safeContext!,
    //       MaterialPageRoute(
    //           builder: (context) => HiWebView(
    //             url: url,
    //             title: title,
    //             hideAppBar: hideAppBar,
    //             statusBarColor: statusBarColor,
    //           )));
    // }
    Get.to(HiWebView(
      url: url,
      title: title,
      hideAppBar: hideAppBar,
      statusBarColor: statusBarColor,
    ));
  }
