import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HttpStudy extends StatefulWidget {
  const HttpStudy({Key? key}) : super(key: key);

  @override
  State<HttpStudy> createState() => _HttpStudyState();
}

class _HttpStudyState extends State<HttpStudy> {
  var reslut = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('基于 Http 实现网络操作')),
      body: Column(children: [_doGetButton(), Text("返回的结果：$reslut")]),
    );
  }

  _doGetButton() {
    return ElevatedButton(onPressed: _doGet, child: const Text("发送 Get 请求"));
  }

  void _doGet() async {
    var uri = Uri.parse("https://api.devio.org/uapi/test?requestPrams=11");
    var response = await http.get(uri);
    if (response.statusCode == 200) {
      setState(() {
        reslut = response.body;
      });
    } else {
      setState(() {
        reslut = "请求失败";
      });
    }
    print("${response.statusCode}");
  }

  /// json 格式数据 需要显示指定 header
  _doPostJson() async {
    var uri = Uri.parse("https://api.devio.org/uapi/test");
    var params = {"requestParam": "doPost"};
    var response = await http.post(uri,
        body: jsonEncode(params),
        headers: {"Content-Type": "application/json"});
  }
}
