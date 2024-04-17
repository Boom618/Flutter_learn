import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

const url =
    'https://www.geekailab.com/io/flutter-trip/Flutter2JSByUrl.html?name=geekailab';

/// Flutter 向 JS 传递数据 —— URL
class Flutter2JsByUrl extends StatefulWidget {
  const Flutter2JsByUrl({super.key});

  @override
  State<Flutter2JsByUrl> createState() => _Flutter2JsByUrlState();
}

class _Flutter2JsByUrlState extends State<Flutter2JsByUrl> {
  late WebViewController controller;
  int progress = 0;

  get _loadBtn => FilledButton(
      onPressed: () {
        // 通过 URL 向 H5 传递数据
        controller.loadRequest(Uri.parse(url));
      },
      child: Text(
        '加载 H5',
        style: TextStyle(color: Colors.white),
      ));

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(NavigationDelegate(onProgress: (progress) {
        setState(() {
          this.progress = progress;
        });
      }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter 向 JS 传递数据'),
        actions: [_loadBtn],
      ),
      body: Stack(
        children: [
          WebViewWidget(
            controller: controller,
          ),
          Positioned(bottom: 100, left: 100, child: Text('加载进度 = $progress'))
        ],
      ),
    );
  }
}
