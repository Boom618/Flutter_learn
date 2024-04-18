import 'package:get/get.dart';
import 'package:started_flutter/mvvm/main/controllers/controller.dart';

/// GetX 依赖注入 管理
class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainViewModel>(() => MainViewModel());
  }
}
