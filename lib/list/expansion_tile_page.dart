import 'package:flutter/material.dart';

const cityNames = {
  '北京': ['东城区', '西城区', '朝阳区', '丰台区', '石景山区', '海淀区', '顺义区'],
  '上海': ['黄浦区', '徐汇区', '长宁区', '静安区', '普陀区', '闸北区', '虹口区'],
  '广州': ['越秀', '海珠', '荔湾', '天河', '白云', '黄埔', '南沙', '番禺'],
  '深圳': ['南山', '福田', '罗湖', '盐田', '龙岗', '宝安', '龙华'],
  '杭州': ['上城区', '下城区', '江干区', '拱墅区', '西湖区', '滨江区'],
  '苏州': ['姑苏区', '吴中区', '相城区', '高新区', '虎丘区', '工业园区', '吴江区']
};

/// 可展开的 列表，二级 list
class ExpansionTilePage extends StatelessWidget {
  const ExpansionTilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "可展开的列表",
      home: Scaffold(
        appBar: AppBar(
          title: Text("可展开的列表"),
        ),
        body: ListView(
          children: _buildList(),
        ),
      ),
    );
  }

  List<Widget> _buildList() {
    List<Widget> widgets = [];
    for (var key in cityNames.keys) {
      widgets.add(_item(key, cityNames[key]!));
    }

    return widgets;
  }

  Widget _item(String city, List<String> subCity) {
    /// ExpansionTile 可展开的组件
    return ExpansionTile(
      title: Text(
        city,
        style: const TextStyle(fontSize: 20, color: Colors.red),
      ),
      children: subCity.map((sub) => _buildSubCity(sub)).toList(),
    );
  }

  /// 二级 list 的 item
  Widget _buildSubCity(String sub) {
    /// 用法与 SizedBox 类似，只不过 FractionallySizedBox 的宽高是百分比大小
    return FractionallySizedBox(
      widthFactor: 1,
      child: Container(
        height: 50,
        margin: const EdgeInsets.only(bottom: 5),
        child: Text(sub),
      ),
    );
  }
}
