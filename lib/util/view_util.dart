import 'package:flutter/material.dart';

/// 间距
SizedBox hiSpace({double mHeight = 1, double mWidth = 1}) {
  return SizedBox(
    height: mHeight,
    width: mWidth,
  );
}

///添加阴影
Widget shadowWarp({required Widget child, EdgeInsetsGeometry? padding}) {
  return Container(
    padding: padding,
    decoration: const BoxDecoration(
        gradient: LinearGradient(
          //AppBar渐变遮罩背景
            colors: [Color(0x66000000), Colors.transparent],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter)),
    child: child,
  );
}