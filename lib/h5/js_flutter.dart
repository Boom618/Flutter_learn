import 'package:flutter/material.dart';
import 'package:started_flutter/h5/js_flutter_by_url.dart';

import '../navigator/tab_navigator.dart';
import 'flutter2Js_by_url.dart';
import 'flutter2js_by_runjavascript.dart';
import 'js_flutter_by_channel.dart';

/// JS 与 Flutter 交互
class JsFlutter extends StatelessWidget {
  const JsFlutter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('JS 与 Flutter 交互'),
      ),
      body: Column(
        children: [
          _Navigation(context, Js2FlutterByUrl(), "Js 向Flutter 传递数据 通过 URL 方式"),
          _Navigation(context, Js2FlutterByChannel(), "Js 向Flutter 传递数据 通过 javascriptChannels 方式"),
          _Navigation(context, Flutter2JsByUrl(), "Flutter 向 Js 传递数据 通过 URL 方式"),
          _Navigation(context, Flutter2JsRunJavaScript(), "Flutter 向 Js 传递数据 通过 runJavaScript 方式"),
          _Navigation(context, TabNavigator(), "项目登录页面"),
        ],
      ),
    );
  }

  /// 跳转
  _Navigation(BuildContext context, Widget page, String title) {
    return FilledButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (BuildContext context) => page));
        },
        child: Text(title));
  }
}
