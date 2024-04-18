import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:started_flutter/model/travel_tab_model.dart';

import '../dao/travel_dao.dart';

/// 创建 GetxController
/// 初始化 GetxController
class TravelTabController extends GetxController {
  final String groupChannelCode;

  TravelTabController(this.groupChannelCode);

  // 添加响应式变量（ 会造成页面变化的 变量需要设置成 响应式变量）
  final travelItems = <TravelItem>[].obs;
  final loading = true.obs;
  int pageIndex = 1;
  final ScrollController scrollController =
      ScrollController(); // 用于监听滚动位置的ScrollController

  @override
  void onClose() {
    super.onClose();
    // 销毁
    scrollController.dispose();
  }

  // 生命周期 init
  @override
  void onInit() {
    super.onInit();
    loadData();
    // 添加滚动监听
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        loadData(loadMore: true);
      }
    });
  }

  Future<void> loadData({loadMore = false}) async {
    if (loadMore) {
      pageIndex++;
    } else {
      pageIndex = 1;
    }
    try {
      TravelTabModel? model =
          await TravelDao.getTravels(groupChannelCode, pageIndex, 10);
      List<TravelItem> items = _filterItems(model?.list);
      if (loadMore && items.isEmpty) {
        pageIndex--;
      }
      // 响应式变量复值 .value 的方式
      loading.value = false;
      if (!loadMore) {
        travelItems.clear();
      }
      travelItems.addAll(items);
    } catch (e) {
      //当出现类型转换异常时可以取消catchError，然后通过debug模式定位类型转换异常的字段
      debugPrint(e.toString());
      loading.value = false;
      if (loadMore) {
        pageIndex--;
      }
    }
  }

  /// 移除article为空的模型
  List<TravelItem> _filterItems(List<TravelItem>? list) {
    if (list == null) return [];
    List<TravelItem> filterItems = [];
    for (var item in list) {
      if (item.article != null) {
        filterItems.add(item);
      }
    }
    return filterItems;
  }
}
