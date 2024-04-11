import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:started_flutter/http/data_model.dart';

/// Json 解析与 Dart model 的使用
class JsonParsingPage extends StatefulWidget {
  const JsonParsingPage({super.key});

  @override
  State<JsonParsingPage> createState() => _JsonParsingPageState();
}

class _JsonParsingPageState extends State<JsonParsingPage>
    with SingleTickerProviderStateMixin {
  var resultShow = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Json 解析与 Dart model 的使用"),
      ),
      body: Column(
        children: [
          _Json2MapBtn(),
          _Json2ModelBtn(),
          Text("结果是 ： ${resultShow}")
        ],
      ),
    );
  }

  _Json2MapBtn() {
    // ElevatedButton 可点击的按钮
    return ElevatedButton(onPressed: _json2Map, child: Text("Json 转 Map"));
  }

  _Json2ModelBtn() {
    return ElevatedButton(onPressed: _json2Model, child: Text("Json 转 Model"));
  }

  // JSON 转 Map 解析数据
  void _json2Map() {
    var jsonString =
        '{ "code": 0, "data": { "code": 0, "method": "POST", "jsonParams": { "json": "123" } }, "msg": "SUCCESS." }';

    // 解析完后是一个动态类型 dynamic
    Map<String, dynamic> map = jsonDecode(jsonString);
    setState(() {
      resultShow = "code ${map["code"]} , msg = ${map["msg"]}";
    });
  }

  // JSON 转 Model
  void _json2Model() {
    var jsonString =
        '{"code":0,"data":{"code":0,"method":"GET","requestPrams":"11"},"msg":"SUCCESS."}';
    Map<String, dynamic> map = jsonDecode(jsonString); // json 转 map
    DataModel model = DataModel.fromJson(map); // map 转 Dart Model
    setState(() {
      resultShow =
      "code === ${model.code} , msg = ${model.msg} ,requestPrams =  ${model.data
          ?.requestPrams}";
    });
  }
}
