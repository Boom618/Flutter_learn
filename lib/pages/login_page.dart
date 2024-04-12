import 'package:flutter/material.dart';

import '../util/string_util.dart';
import '../util/view_util.dart';
import '../widget/input_widget.dart';

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
            })
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
}
