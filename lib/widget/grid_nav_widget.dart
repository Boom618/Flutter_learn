import 'package:flutter/material.dart';

import '../model/home_model.dart';

/// 网格布局
class GridNavWidget extends StatelessWidget {
  final GridNav gridNavModel;

  const GridNavWidget({super.key, required this.gridNavModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      // 裁切圆角
      padding: EdgeInsets.fromLTRB(7, 0, 7, 0),
      child: PhysicalModel(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(6),
        clipBehavior: Clip.antiAlias, // 裁切行为
        child: Column(
          children: [_gridNavItems(context)],
        ),
      ),
    );
  }

  /// 添加 三个导航条
  _gridNavItems(BuildContext context) {
    List<Widget> items = [];
    items.add(_gridNavItem(context, gridNavModel.hotel!, true));
    items.add(_gridNavItem(context, gridNavModel.flight!, false));
    items.add(_gridNavItem(context, gridNavModel.travel!, false));

    return items;
  }

  /// 添加导航条，first 是否为第一个导航条
  Widget _gridNavItem(BuildContext context, Hotel gridNavItem, bool first) {
    List<Widget> items = [];

    items.add(_mainItem(context, gridNavItem.mainItem!));
    items.add(_doubleItem(context, gridNavItem.item1!, gridNavItem.item2!));
    items.add(_doubleItem(context, gridNavItem.item3!, gridNavItem.item4!));
    // 从左到右的 Widget
    List<Widget> expandItems = [];
    for (var item in items) {
      //设置每个item 平分 间距
      expandItems.add(Expanded(flex: 1, child: item));
    }
    Color startColor = Color(int.parse('0xff${gridNavItem.startColor!}'));
    Color endColor = Color(int.parse('0xff${gridNavItem.endColor!}'));
    return Container(
      height: 88,
      margin: first ? null : const EdgeInsets.only(top: 3),
      decoration: BoxDecoration(
          //线性渐变
          gradient: LinearGradient(colors: [startColor, endColor])),
      child: Row(children: expandItems),
    );
  }

  /// 左侧大卡片
  Widget _mainItem(BuildContext context, CommonModel model) {
    return _wrapGesture(
        context,
        Stack(
          // 对齐方式，顶部
          alignment: AlignmentDirectional.topCenter,
          children: [
            Image.network(
              model.icon!,
              fit: BoxFit.contain,
              width: 121,
              height: 88,
              alignment: AlignmentDirectional.bottomEnd,
            ),
            Container(
              margin: EdgeInsets.only(top: 11),
              child: Text(
                model.title!,
                style: TextStyle(fontSize: 14, color: Colors.white),
              ),
            ),
          ],
        ),
        model);
  }

  // 手势包裹器
  Widget _wrapGesture(BuildContext context, Widget widget, CommonModel model) {
    return GestureDetector(
      onTap: () {
        // todo h5
      },
      child: widget,
    );
  }

  /// 右侧 上下 卡片
  Widget _doubleItem(
      BuildContext context, CommonModel topItem, CommonModel bottomItem) {
    return Column(
      children: [
        // Expanded 调整子组件的大小，让其占满空间
        Expanded(child: _item(context, topItem, true)),
        Expanded(child: _item(context, bottomItem, false)),
      ],
    );
  }

  /// 上下item,first 是否为第一个item
  _item(BuildContext context, CommonModel item, bool first) {
    // 画线
    BorderSide borderSide = const BorderSide(width: 0.8, color: Colors.white);

    return Container(
      decoration: BoxDecoration(
          border: Border(
        left: borderSide,
        bottom: first ? borderSide : BorderSide.none,
      )),
      child: _wrapGesture(
          context,
          Container(
            child: Text(
              item.title!,
              style: const TextStyle(fontSize: 14, color: Colors.white),
            ),
          ),
          item),
    );
  }
}
