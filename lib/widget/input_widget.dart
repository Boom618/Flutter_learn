import 'package:flutter/material.dart';

/// 登录输入框，自定义 widget
class InputWidget extends StatelessWidget {
  final String hint;

  // 回调函数，给使用者 ，回传值 ，与  VoidCallback 不同
  final ValueChanged<String> onChanged;

  // 是否要隐藏输入内容
  final bool obscureText;
  final TextInputType? keyboardType;

  // 参数添加到构造方法里面
  const InputWidget(this.hint,
      {super.key,
      required this.onChanged,
      this.obscureText = false,
      this.keyboardType});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _input(),
        const Divider(
          color: Colors.white,
          height: 1,
          thickness: 0.5, // 粗细
        )
      ],
    );
  }

  _input() {
    return TextField(
        onChanged: onChanged,
        obscureText: obscureText,
        keyboardType: keyboardType,
        autofocus: !obscureText,
        // 自动获取焦点
        cursorColor: Colors.white,
        // 光标颜色
        style: const TextStyle(
          fontSize: 17,
          color: Colors.white,
          fontWeight: FontWeight.w400,
        ),
        // 输入框样式
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hint,
            hintStyle: const TextStyle(fontSize: 17, color: Colors.grey)));
  }

}
