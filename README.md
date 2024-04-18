# started_flutter

A new Flutter project.

## 版本

- Flutter 3.19.2
- Gradle 7.5

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

> 第六课：
- 屏幕适配

> 第七课：
- 基于PageView与BottomNavigationBar搭建首页导航框架
- 封装的艺术之轮播图组件的实现
- 基于Opacity 与 NotificationListener 实现AppBar 滚动渐变效果

> 第八课：
- 基于 ListView 实现水平和垂直方式滚动的列表
- 基于 ExpansionTile 实现可展开的列表
- 基于GridView实现网格列表
- 高级功能列表下拉刷新与上拉加载更多功能实现

> 第九课：
- 首页网格布局


> 第十课：
- 自定义SearchBar结构框架实现
- TextField输入框自定义样式扩展
- 基于SearchBar实现首页AppBar
- 基于ListView实现搜索列夫与实时搜索的优化
- 动态Icon与富文本展示


> 11 课：
- 瀑布流
- TabBar+TabBarView 实现旅拍可滑动切换多Tab

> 12 课：
- webview flutter 使用详解
- H5容器widget封装
- 基于H5容器实现H5混合开发
- 基于H5容器实现我的页面
- Fultter 与 H5 交互 :在 Web View 中利用 controller 动态执行 js 操作

> 13 课；
- Flutter 与 H5 通信的几种方式
    - js 向 Flutter 传递数据:通过 URL 方式、通过 javaScriptChannels 方式
    - Flutter 向 js 传递数据:通过 URL 方式、通过 runJavaScript 方式
- Flutter 与 H5通讯原理
- Flutter 与 H5 路由跳转

类比 Android 原生交互
```
- Android 调用 JS：
  - WebView 的 loadUrl
  - WebView 的 evaluateJavascript
- JS 调用 Android：
  - WebView 的 addJavascriptInterface
  - WebViewClient 的 shouldOverrideLoading 方法拦截 url
```

> 14 课：
- 开发Flutter包和插件
- Flutter 包和插件的开发与发布

> 15 课：
- 启动白屏问题优化与启动屏制作
- Flutter升级与适配指南
- 编译和打出 Android 和 IOS 应用

> 16 课：
- GetX ：路由、状态管理、依赖注入
- 使用Obx与Getx做状态管理
- 使用GetBuilder做状态管理
- 使用getx实现MVVM架构

## 常见 Widget

- 布局 Widget
- 文本 Widget
- 可滚动的 Widget
- 绘制和裁切 Widget
- 图片和资产 Widget
- 样式 Widget

## 插件

- url_launcher： Flutter 与 H5 交互插件
- flutter_hi_cache ： 缓存插件
- 屏幕适配：逻辑像素 = 物理像素 px / 设备像素比 dpr(devicePixelRatio)

## Widget

- RefreshIndicator 实现下拉刷新
- PhysicalModel ，裁切组件，主要的功能就是设置 widget 四边圆角
- Expanded 它可以动态调整 child 组件沿主轴的尺寸
- Opacity：它的作用是给子组件添加一个透明度的属性
- SizedBox ：它可以给子组件添加一个固定尺寸的属性
- Container ：通用的布局组件，可以设置背景颜色、边框、圆角等
- RichText ：富文本
- TextField：输入框
- BoxDecoration ：装饰器可以给 Container 添加背景图片、边框、圆角、渐变等
- TickerProviderStateMixin 是 Flutter 中用于创建动画的类,通常与 AnimationController 一起使用
- AutomaticKeepAliveClientMixin: 在规避页面被重建、防止数据丢失