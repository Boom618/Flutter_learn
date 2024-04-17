import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

const String h5JS2FlutterByChannel = '''
<!DOCTYPE html>
<html lang="zh">
<head>
<meta charset="utf-8">
<title>通过javascriptChannels向flutter传递参数</title>
</head>
<body>
<button id="btn" style="font-size: 2.5em">通过javascriptChannels向flutter传递参数</button>
<script type="text/javascript">
var btn = document.getElementById("btn");
btn.addEventListener('click', function () {
//通过注册的hiPop channel向flutter发送消息
hiPop.postMessage("Hi Pop");
}, false)
</script>
</body>
</html>
''';

/// JS 向 Flutter 传递数据 通过通 javascriptChannels 的方式
class Js2FlutterByChannel extends StatefulWidget {
  const Js2FlutterByChannel({super.key});

  @override
  State<Js2FlutterByChannel> createState() => _Js2FlutterByChannelState();
}

class _Js2FlutterByChannelState extends State<Js2FlutterByChannel> {
  late WebViewController controller;

  /// 按钮
  get _loadBtn => FilledButton(onPressed: (){
    controller.loadHtmlString(h5JS2FlutterByChannel);
  }, child: Text('JS 向 Flutter 传递数据,通过 javascriptChannels 方式'));

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..addJavaScriptChannel('hiPop',
          onMessageReceived: (JavaScriptMessage message) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(message.message)));
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('加载 H5'),actions: [_loadBtn],),
      body: WebViewWidget(controller: controller),
    );
  }
}
