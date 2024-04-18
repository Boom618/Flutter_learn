import 'package:flutter/material.dart';
import 'package:started_flutter/dao/login_dao.dart';
import 'package:url_launcher/url_launcher.dart';

import '../util/navigator_util.dart';
import '../util/string_util.dart';
import '../util/view_util.dart';
import '../widget/input_widget.dart';
import '../widget/login_widget.dart';

/// 登录页面
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool loginEnable = false;
  String? username;
  String? password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, // 防止键盘弹起 影响布局
      // Stack 堆叠布局
      body: Stack(
        children: [..._backgrounds(), _content()],
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
              onChanged: (text) {
                username = text;
                _checkInput();
              },
            ),
            hiSpace(mHeight: 10),
            InputWidget("请输入密码", obscureText: true, onChanged: (text) {
              password = text;
              _checkInput();
            }),
            hiSpace(mHeight: 45),
            LoginButton(
              "登录",
              enable: loginEnable,
              // onPressed 监听长按
              onPressed: () => _login(), // 或者 onPressed: _login
            ),
            hiSpace(mHeight: 15),
            // 居右
            Align(
              alignment: Alignment.centerRight,
              child: InkWell(
                // onTap ：监听点击事件
                onTap: () => _jumpRegistration(),
                child: const Text(
                  "账号注册",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ));
  }

  void _checkInput() {
    bool enable;
    if (isNotEmpty(username) && isNotEmpty(password)) {
      enable = true;
    } else {
      enable = false;
    }
    setState(() {
      loginEnable = enable;
      print("loginEnable = $loginEnable");
    });
  }

  // 登录逻辑
  _login() async {
    try {
      //var result = await LoginDao.login(userName: username!, password: password!);
      // print(result);
      NavigatorUtil.pushHome(context);
    } catch (e) {
      print(e);
    }
  }

  // 注册 Flutter 页面跳转 H5 页面，交互
  _jumpRegistration() async {
    //
    Uri uri = Uri.parse(
        "https://api.geekailab.com/uapi/swagger-ui.html#/Account/registrationUsingPOST");
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw "Could not launch $uri";
    }
  }
}
