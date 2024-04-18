import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:started_flutter/widget/loading_container.dart';
import 'package:started_flutter/widget/travel_item_widget.dart';

import '../controller/travel_tab_controller.dart';
import '../dao/travel_dao.dart';
import '../model/travel_tab_model.dart';

/// 旅拍tab页, 这是一个页面，所以是一个有状态的 Widget
class TravelTabPage extends StatefulWidget {
  final String groupChannelCode;

  const TravelTabPage({super.key, required this.groupChannelCode});

  @override
  State<StatefulWidget> createState() => _TravelTabPage();
}

class _TravelTabPage extends State<TravelTabPage>
    with AutomaticKeepAliveClientMixin {
  late TravelTabController controller;

  get _gridViews => MasonryGridView.count(
      crossAxisCount: 2,
      controller: controller.scrollController,
      itemCount: controller.travelItems.length,
      itemBuilder: (BuildContext context, int index) {
        return TravelItemWidget(
          item: controller.travelItems[index],
          index: index,
        );
      });

  /// obX 状态管理，写法更加简介，obx 不能嵌套 obx . 【使用 getX obX 的状态管理时，必须有一个响应式变量，否则报错】
  get _obx => Obx(() => LoadingContainer(
      isLoading: controller.loading.value,
      child: RefreshIndicator(
        onRefresh: _handleRefresh,
        color: Colors.blue,
        child: MediaQuery.removePadding(
          removeTop: true,
          context: context,
          child: _gridViews,
        ),
      )));

  /// GetX 状态管理,需要传入 controller ，只能管理一个 controller，
  get _getx => GetX<TravelTabController>(
        builder: (controller) {
          return LoadingContainer(
            isLoading: controller.loading.value,
            child: RefreshIndicator(
              onRefresh: _handleRefresh,
              color: Colors.blue,
              child: MediaQuery.removePadding(
                removeTop: true,
                context: context,
                child: _gridViews,
              ),
            ),
          );
        },
        init: controller,
      );

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: _getx,
    );
  }

  @override
  void initState() {
    // 默认情况下，Get put 是单例的，如果需要多个实例，需要设置不同的 tag
    controller = Get.put(TravelTabController(widget.groupChannelCode),
        tag: widget.groupChannelCode);
    super.initState();
  }

  @override
  bool get wantKeepAlive => true; // 常驻内存

  Future<void> _handleRefresh() async {
    await controller.loadData();
    return;
  }
}
