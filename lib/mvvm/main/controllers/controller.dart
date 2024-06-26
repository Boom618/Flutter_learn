import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainViewModel extends GetxController {
  final PageController controller = PageController(initialPage: 0);
  final currentIndex = 0.obs; // 设置成响应式

  /// 页面切换监听
  void onBottomNavTap(int index) {
    currentIndex(index);
    // currentIndex.value = index;
    controller.jumpToPage(index);
  }
}
