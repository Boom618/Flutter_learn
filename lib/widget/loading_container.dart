import 'package:flutter/material.dart';

class LoadingContainer extends StatelessWidget {
  final Widget child;
  final bool isLoading;
  final bool cover; // 是 叠加在 child 之上 还是 替换 child

  const LoadingContainer(
      {super.key,
      required this.child,
      required this.isLoading,
      this.cover = false});

  /// 叠加
  get coverView => Stack(
        children: [child, isLoading ? _loadingView : Container()],
      );

  get normalView => isLoading ? _loadingView : child;

  /// 加载 loading
  get _loadingView => Container(
        child: const CircularProgressIndicator(
          color: Colors.blue,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return cover ? coverView : normalView;
  }
}
