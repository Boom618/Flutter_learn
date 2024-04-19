import 'package:get/get.dart';
import 'package:started_flutter/mvvm/main/binding/main_binding.dart';

// 项目初始化绑定
class InitialBinding extends Bindings{

  @override
  void dependencies() {
    MainBinding().dependencies();
  }

}