import 'package:get/get.dart';
import 'package:started_flutter/mvvm/login/controllers/controller.dart';

/// 使用 GetX 框架时，需要创建一个 Bindings 类来处理依赖注入。
class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginViewModel>(() => LoginViewModel());
  }
}
