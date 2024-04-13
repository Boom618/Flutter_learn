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
        Row(
          mainAxisAlignment: MainAxisAlignment.center, // 居中显示
          children: items.sublist(0, 1),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center, // 居中显示
          children: items.sublist(1, 2),
        ),
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
}
