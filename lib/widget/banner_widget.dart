import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:started_flutter/util/screen_adapter_helper.dart';

import '../model/home_model.dart';
import '../util/navigator_util.dart';

///封装的艺术之轮播图组件的实现
class BannerWidget extends StatefulWidget {
  final List<CommonModel> bannerList;

  const BannerWidget({Key? key, required this.bannerList}) : super(key: key);

  @override
  State<BannerWidget> createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    // Stack 层级布局
    return Stack(
      children: [
        // 底部图片
        CarouselSlider(
          items:
              widget.bannerList.map((item) => _tabImage(item, width)).toList(),
          carouselController: _controller,
          // 设置属性
          options: CarouselOptions(
              height: 160.px,
              autoPlay: true,
              viewportFraction: 1.0,
              // 页面发生切换回调
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              }),
        ),
        // 指示器：创建一个小组件，用于控制 [Stack] 的子项的位置
        Positioned(bottom: 10, left: 0, right: 0, child: _indicator())
      ],
    );
  }

  Widget _tabImage(CommonModel model, double width) {
    return GestureDetector(
      onTap: () {
        NavigatorUtil.jumpH5(
            url: model.url, title: model.title, hideAppBar: model.hideAppBar);
      },
      child: Image.network(
        "http://inews.gtimg.com/newsapp_bt/0/14268490256/641",//model.icon!,
        width: width,
        fit: BoxFit.cover,
      ),
    );
  }

  /// 指示器
  _indicator() {
    return Row( // 左右排列
      mainAxisAlignment: MainAxisAlignment.center, // 居中
      children: widget.bannerList.asMap().entries.map((entry) { /// entries.map 是 Dart list 取数据语法
        return GestureDetector( /// 手势识别的组件，可以识别点击、双击、长按、拖动、缩放等手势
          onTap: () => _controller.animateToPage(entry.key),
          child: Container(
            width: 6,
            height: 6,
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),/// 中间间隔
            decoration: BoxDecoration(
              shape: BoxShape.circle, /// 形状 ，圆
              color:
                  (Colors.red).withOpacity(_current == entry.key ? 0.9 : 0.4),/// withOpacity 颜色透明度
            ),
          ),
        );
      }).toList(),
    );
  }
}
