import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:started_flutter/widget/loading_container.dart';
import 'package:started_flutter/widget/travel_item_widget.dart';

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
  // 保持页面，防止下次回来，重新加载数据
  List<TravelItem> travelItems = [];
  int pageIndex = 1;
  bool _loading = true;

  // 跟 listView 的 Controller 一样，这里也需要一个 Controller
  final ScrollController _scrollController = ScrollController();

  get _gridViews => MasonryGridView.count(
      crossAxisCount: 2,
      controller: _scrollController,
      itemCount: travelItems.length,
      itemBuilder: (BuildContext context, int index) {
        return TravelItemWidget(
          item: travelItems[index],
          index: index,
        );
      });

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: LoadingContainer(
        isLoading: _loading,
        child: RefreshIndicator(
          onRefresh: _loadData,
          color: Colors.blue,
          child: MediaQuery.removePadding(
            removeTop: true,
            context: context,
            child: _gridViews,
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    _loadData();
    // 添加滚动监听
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _loadData(loadMore: true);
      }
    });
    super.initState();
  }

  Future<void> _loadData({loadMore = false}) async {
    if (loadMore) {
      pageIndex++;
    } else {
      pageIndex = 1;
    }
    try {
      TravelTabModel? model =
          await TravelDao.getTravels(widget.groupChannelCode, pageIndex, 10);
      List<TravelItem> items = _filterItems(model?.list);
      if (loadMore && items.isEmpty) {
        pageIndex--;
      }
      setState(() {
        _loading = false;
        if (loadMore) {
          travelItems.addAll(items);
        } else {
          travelItems = items;
        }
      });
    } catch (e) {
      //当出现类型转换异常时可以取消catchError，然后通过debug模式定位类型转换异常的字段
      debugPrint(e.toString());
      _loading = false;
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

  @override
  bool get wantKeepAlive => true; // 常驻内存

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
