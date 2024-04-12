import 'package:flutter/material.dart';

const cityNames = [
  '北京',
  '上海',
  '广州',
  '深圳',
  '杭州',
  '苏州',
  '成都',
  '武汉',
  '郑州',
  '洛阳',
  '厦门',
  '青岛',
  '拉萨'
];

///

class GridViewPage extends StatelessWidget {
  const GridViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "GridView",
      home: Scaffold(
          appBar: AppBar(
            title: Text("GridView"),
          ),
          body: GridView.count(
            crossAxisCount: 2,
            children: _buildList(),
          )),
    );
  }

  _buildList() {
    // return cityNames.map((e) => _item(e)).toList();
    return cityNames.map((city) => _item(city)).toList();
  }

  Widget _item(String city) {
    return Container(
      height: 80,
      margin: const EdgeInsets.only(bottom: 5, right: 5, left: 5),
      alignment: Alignment.center,
      decoration: const BoxDecoration(color: Colors.amber),
      child: Text(
        city,
        style: const TextStyle(color: Colors.white, fontSize: 20),
      ),
    );
  }
}
