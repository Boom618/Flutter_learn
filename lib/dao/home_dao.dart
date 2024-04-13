/// Future对象表示异步操作的结果，我们通常通过then（）来处理返回的结果
/// async用于标明函数是一个异步函数，其返回值类型是Future类型
/// await用来等待耗时操作的返回结果，这个操作会阻塞到后面的代码
///
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:started_flutter/dao/header_util.dart';
import 'package:started_flutter/model/home_model.dart';
import 'package:started_flutter/util/navigator_util.dart';


/// 首页大接口
class HomeDao {
  static Future<HomeModel> featch() async {
    var url = Uri.parse("https://api.geekailab.com/uapi/ft/home");
    final response = await http.get(url, headers: hiHeaders());
    // fix 中文乱码
    Utf8Decoder utf8decoder = Utf8Decoder();
    String bodyString = utf8decoder.convert(response.bodyBytes);
    debugPrint(bodyString);
    if (response.statusCode == 200) {
      var result = json.decode(bodyString);
      HomeModel homeModel = HomeModel.fromJson(result['data']);
      return homeModel;
    } else {
      if (response.statusCode == 401) {
        // 访问被拒绝
        NavigatorUtil.pushLogin();
      }
      throw Exception(bodyString);
    }
  }
}
