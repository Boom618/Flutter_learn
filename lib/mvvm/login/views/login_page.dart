import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:started_flutter/dao/login_dao.dart';
import 'package:started_flutter/mvvm/login/controllers/controller.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../util/navigator_util.dart';
import '../../../util/string_util.dart';
import '../../../util/view_util.dart';
import '../../../widget/input_widget.dart';
import '../../../widget/login_widget.dart';

/// 登录页面
// class LoginPage extends StatefulWidget {
class LoginPage extends GetView<LoginViewModel> {
  const LoginPage({super.key});

  // @override
  // State<LoginPage> createState() => _LoginPageState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, // 防止键盘弹起 影响布局
      // Stack 堆叠布局
      body: Stack(
        children: [..._backgrounds(), Obx(() => _content())],
      ),
    );
  }

  _backgrounds() {
    return [
      Positioned.fill(
          child: Image.asset("images/login-bg1.jpg", fit: BoxFit.cover)),
      // 蒙层
      Positioned.fill(
          child: Container(
        decoration: const BoxDecoration(color: Colors.black54),
      ))
    ];
  }

  _content() {
    return Positioned.fill(
        left: 25,
        right: 25,
        child: ListView(
          children: [
            hiSpace(mHeight: 100),
            const Text(
              "账号密码登录",
              style: TextStyle(fontSize: 25, color: Colors.white),
            ),
            hiSpace(mHeight: 40),
            InputWidget(
              "请输入账号",
              onChanged: (text) =>
                  controller.onValueChange(LoginInputType.username, text),
            ),
            hiSpace(mHeight: 10),
            InputWidget("请输入密码",
                obscureText: true,
                onChanged: (text) =>
                    controller.onValueChange(LoginInputType.password, text)),
            hiSpace(mHeight: 45),
            LoginButton(
              "登录",
              enable: controller.loginEnable.value,
              // onPressed 监听长按
              onPressed: () => controller.login(), // 或者 onPressed: _login
            ),
            hiSpace(mHeight: 15),
            // 居右
            Align(
              alignment: Alignment.centerRight,
              child: InkWell(
                // onTap ：监听点击事件
                onTap: () => controller.jumpRegistration(),
                child: const Text(
                  "账号注册",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ));
  }
}
