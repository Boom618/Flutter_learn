import 'package:flutter/material.dart';

class RefreshLoadMorePage extends StatefulWidget {
  const RefreshLoadMorePage({super.key});

  @override
  State<RefreshLoadMorePage> createState() => _RefreshLoadMorePageState();
}

class _RefreshLoadMorePageState extends State<RefreshLoadMorePage> {
  final ScrollController _scrollController = ScrollController();
  List<String> cityNames = [
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

  @override
  void initState() {
    // 页面完成装载的时间
    _scrollController.addListener(() {
      // 滑动到最后位置
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _loadData();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "上拉加载更多",
      home: Scaffold(
        appBar: AppBar(
          title: Text("上拉加载更多"),
        ),
        /// RefreshIndicator 对 ListView 进行下拉刷新
        body: RefreshIndicator(
          onRefresh: _handleRefresh,
          child: ListView(
            controller: _scrollController,
            children: _buildList(),
          ),
        ),
      ),
    );
  }

  _buildList() {
    return cityNames.map((cityName) => _item(cityName)).toList();
  }

  Widget _item(String cityName) {
    return Container(
      height: 80,
      margin: const EdgeInsets.only(bottom: 5),
      decoration: const BoxDecoration(color: Colors.redAccent),
      child: Text(
        cityName,
        style: const TextStyle(fontSize: 18, color: Colors.white),
      ),
    );
  }

  /// 下拉刷新
  Future<void> _handleRefresh() async {
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      cityNames = cityNames.reversed.toList();
    });
  }

  /// 加载更多
  void _loadData() async{
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      List<String> list = List<String>.from(cityNames);
      list.addAll(cityNames);

      cityNames = list;
    });

  }
}
