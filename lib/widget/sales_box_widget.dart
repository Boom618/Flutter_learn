import 'package:flutter/material.dart';

import '../model/home_model.dart';

/// 底部卡片入口
class SalesBoxWidget extends StatelessWidget {
  final SalesBox salesBox;

  const SalesBoxWidget({super.key, required this.salesBox});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(7, 0, 7, 4),
      decoration: BoxDecoration(color: Colors.white),
      child: _items(context),
    );
  }

  _items(BuildContext context) {
    List<Widget> items = [];
    items.add(_doubleItem(
        context, salesBox.bigCard1!, salesBox.bigCard2!, true, false));

    items.add(_doubleItem(
        context, salesBox.smallCard1!, salesBox.smallCard2!, false, false));

    items.add(_doubleItem(
        context, salesBox.smallCard3!, salesBox.smallCard4!, false, false));

    return Column(
      children: [
        _titleItem(),// 更多活动
        // 大卡片
        Row(
          mainAxisAlignment: MainAxisAlignment.center, // 居中显示
          children: items.sublist(0, 1),
        ),
        // 中间小卡片
        Row(
          mainAxisAlignment: MainAxisAlignment.center, // 居中显示
          children: items.sublist(1, 2),
        ),
        // 第三列小卡片
        Row(
          mainAxisAlignment: MainAxisAlignment.center, // 居中显示
          children: items.sublist(2, 3),
        ),
      ],
    );
  }

  /// 底部成对的卡片，leftCard 左侧卡片，rightCard 右侧卡片，big 是否为大卡片，last 是否为最后一行卡片
  Widget _doubleItem(BuildContext context, CommonModel leftCard,
      CommonModel rightCard, bool big, bool last) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _item(context, leftCard, big, true, last),
        _item(context, rightCard, big, false, last),
      ],
    );
  }

  /// 底部卡片，big 是否为大卡片，last 是否为最后一行卡片
  _item(BuildContext context, CommonModel leftCard, bool big, bool left,
      bool last) {
    BorderSide borderSide =
        const BorderSide(width: 0.8, color: Color(0xfff2f2f2));
    double mWidth = MediaQuery.of(context).size.width / 2 - 10;
    return GestureDetector(
      onTap: () {
        // todo H5
      },
      child: Container(
        decoration: BoxDecoration(
          // 边框（Border）
          border: Border(
            right: left ? borderSide : BorderSide.none,
            bottom: last ? BorderSide.none : borderSide,
          ),
        ),
        child: Image.network(salesBox.icon!,
            fit: BoxFit.fill, width: mWidth, height: big ? 136 : 80),
      ),
    );
  }

  /// 活动 Item
  _titleItem() {
    return Container(
      height: 45,
      margin: EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(width: 1, color: Color(0xfff2f2f2))),
      ),
      child: Row(
        // 对其方式
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // fit: BoxFit.fill 填充方式
          Image.network(salesBox.icon!, width: 15, fit: BoxFit.fill),
          _moreItem()
        ],
      ),
    );
  }

  // 更多活动
  _moreItem() {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 1, 8, 1),
      margin: EdgeInsets.only(right: 7),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: const LinearGradient(
            colors: [Color(0xffff4e63), Color(0xffff6cc9)],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight),
      ),
      child: GestureDetector(
        onTap: () {
          // todo h5
        },
        child: const Text(
          "获取更多福利 >",
          style: TextStyle(fontSize: 12, color: Colors.white),
        ),
      ),
    );
  }
}
