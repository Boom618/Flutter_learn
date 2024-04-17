import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

const String h5Flutter2JSByrunJavaScript = '''
<!DOCTYPE html>
<html lang="zh">
<head>
<meta charset="utf-8">
<title>Flutter向H5传递数据-通过runJavaScript</title>
<script type="text/javascript">
function hiCallJs(msg) {
document.getElementById('resultTxt').innerHTML = 'Flutter传递过来的数据：' + msg;
}
function hiCallJsWithResult(v1, v2) {
return parseInt(v1) + parseInt(v2);
}
</script>
</head>
<body>
<div id="resultTxt" style="font-size: 2.5em">这里展示Flutter传递过来的数据</button>
</body>
</html>
''';

/// Flutter 向 JS 传递数据 —— RunJavaScript
class Flutter2JsRunJavaScript extends StatefulWidget {
  const Flutter2JsRunJavaScript({super.key});

  @override
  State<Flutter2JsRunJavaScript> createState() =>
      _Flutter2JsRunJavaScriptState();
}

class _Flutter2JsRunJavaScriptState extends State<Flutter2JsRunJavaScript> {
  late WebViewController controller;

  get _loadBtn => FilledButton(
      onPressed: () {
        // 加载 String 格式的 Html
        controller.loadHtmlString(h5Flutter2JSByrunJavaScript);
      },
      child: const Text(
        '加载H5',
        style: TextStyle(color: Colors.white),
      ));

  get _fireData => FilledButton(
      onPressed: () async {
        var name = 'boom';
        // 方式一：无返回值 runJavascript 的运行要在H5页面加载完成后进行否则会报：Failed evaluating Javascript.
        controller.runJavaScript("hiCallJs('$name')");// Flutter 通过 runJavaScript 把 name 值传递给 H5
        // 方式二：有返回值
        var result = await controller
            .runJavaScriptReturningResult('hiCallJsWithResult(2,3)');
        debugPrint('result: $result');
      },
      child: Text('发送数据'));

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted); // 开启 js 执行
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter 向 JS 传递数据'),
        actions: [_loadBtn, _fireData],
      ),
      body: WebViewWidget(controller: controller,),
    );
  }
}
