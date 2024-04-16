import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:started_flutter/model/travel_tab_model.dart';
import 'package:underline_indicator/underline_indicator.dart';

import '../dao/travel_dao.dart';
import '../model/travel_category_model.dart';

/// 旅拍页面
class TravelPage extends StatefulWidget {
  const TravelPage({super.key});

  @override
  State<TravelPage> createState() => _TravelPageState();
}

// TickerProviderStateMixin 是 Flutter 中用于创建动画的类,通常与 AnimationController 一起使用
class _TravelPageState extends State<TravelPage> with TickerProviderStateMixin {
  List<TravelTab> tabs = [];
  TravelCategoryModel? travelTabModel;
  late TabController _controller;

  get _tabBar => TabBar(
      controller: _controller,
      isScrollable: true,
      // 是否可以滚动
      labelColor: Colors.black,
      tabAlignment: TabAlignment.start, // 左对齐，去除左边宽度
      indicatorSize: TabBarIndicatorSize.tab, // 以 tab 的宽作为指示器的大小，label ：文字的宽度
      indicator: const UnderlineIndicator(
          // 下划线指示器
          strokeCap: StrokeCap.round,
          borderSide: BorderSide(width: 3, color: Color(0xff2fcfbb)),
          insets: EdgeInsets.only(bottom: 10)),
      tabs: tabs.map<Tab>((TravelTab tab) {
        return Tab(text: tab.labelName);
      }).toList());

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 0, vsync: this);
    TravelDao.getCategory().then((TravelCategoryModel? model) {
      setState(() {
        _controller =
            TabController(length: model?.tabs.length ?? 0, vsync: this);
        travelTabModel = model;
        tabs = model?.tabs ?? [];
      });
    }).catchError((e) {
      debugPrint(e.toString());
      // setState(() {
      //   tabs = [
      //     TravelTab(labelName: 'tab2', groupChannelCode: 'code1'),
      //     TravelTab(labelName: 'tab2', groupChannelCode: 'code2'),
      //     TravelTab(labelName: 'tab3', groupChannelCode: 'code2'),
      //     TravelTab(labelName: 'tab4', groupChannelCode: 'code2'),
      //     TravelTab(labelName: 'tab5', groupChannelCode: 'code2'),
      //   ];
      // });
    });
  }

  /// 页面销毁时调用
  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //获取刘海屏Top安全边距
    double top = MediaQuery.of(context).padding.top;
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: Colors.white,
            padding: EdgeInsets.only(top: top),
            child: _tabBar,
          ),
        ],
      ),
    );
  }
}
