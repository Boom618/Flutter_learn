import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../dao/login_dao.dart';
import '../../../util/navigator_util.dart';

enum LoginInputType { username, password }

/// viewmodel controller
class LoginViewModel extends GetxController {
  final loginEnable = false.obs; // 登录按钮 进行状态管理

  // 用户名和密码
  String? username;
  String? password;

  /// 输入框内容变化
  void onValueChange(LoginInputType type, String value) {
    // 判断输入框类型
    switch (type) {
      case LoginInputType.username:
        username = value;
        break;
      case LoginInputType.password:
        password = value;
        break;
    }
    loginEnable(username != null &&
        username!.isNotEmpty &&
        password != null &&
        password!.isNotEmpty);
  }

  // 登录逻辑
  login() async {
    try {
      var result = await LoginDao.login(userName: username!, password: password!);
      // print(result);
      NavigatorUtil.pushHome();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  // 注册 Flutter 页面跳转 H5 页面，交互
  jumpRegistration() async {
    //
    Uri uri = Uri.parse(
        "https://api.geekailab.com/uapi/swagger-ui.html#/Account/registrationUsingPOST");
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw "Could not launch $uri";
    }
  }
}
