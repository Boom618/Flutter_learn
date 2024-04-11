import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:started_flutter/http/data_model.dart';
import 'package:http/http.dart' as http;

/// Future 与 FutureBuilder 实战应用
///   Future 代表一个可能已经完成或将来会完成的异步操作的结果。在处理异步任务时，我们可以使用 Future 来执行任务并等待其结果。
///   FutureBuilder 是一个 Widget，它接收一个 Future 并根据 Future 的不同状态（未完成、完成、错误等）构建不同的 UI
class FutureStudy extends StatefulWidget {
  const FutureStudy({super.key});

  @override
  State<FutureStudy> createState() => _FutureStudyState();
}

class _FutureStudyState extends State<FutureStudy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Future 与 FutureBuilder 实战应用"),
        ),
        body: FutureBuilder<DataModel>(
          future: fetchGet(),
          // builder 构建器
          builder: (BuildContext context, AsyncSnapshot<DataModel> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return Text("还没有开始网络请求");
              case ConnectionState.waiting:
                return const Center(child: CircularProgressIndicator());
              case ConnectionState.active:
                return const Text('state active');
              case ConnectionState.done:
                if (snapshot.hasError) {
                  return Text("Error: ${snapshot.error}");
                } else {
                  return Text("Contents: ${snapshot.data}");
                }
            }
          },
        ));
  }

  Future<DataModel> fetchGet() async {
    var uri =
        Uri.parse("https://api.geekailab.com/uapi/test/test?requestPrams=11");
    final response = await http.get(uri);
    Utf8Decoder utf8decoder = const Utf8Decoder(); //fix 中文乱码
    var result = json.decode(utf8decoder.convert(response.bodyBytes));
    return DataModel.fromJson(result);
  }
}
