import 'package:flutter/material.dart';

/// 带禁用功能的按钮
class LoginButton extends StatelessWidget {
  final String title;
  final bool enable;

  // 回调函数，不传值
  final VoidCallback? onPressed;

  const LoginButton(this.title, {Key? key, this.enable = true, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: enable ? onPressed : null,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      height: 45,
      disabledColor: Colors.white60,
      color: Colors.orange,
      child: Text(
        title,
        style: const TextStyle(color: Colors.white, fontSize: 16),
      ),
    );
  }
}
