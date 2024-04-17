import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

const String h5JS2FlutterByUrl = '''
<!DOCTYPE html>
<html lang="zh">
<head>
<meta charset="utf-8">
<title>通过URL向flutter传递参数</title>
</head>
<body>
<button id="btn" style="font-size: 2.5em">Js 通过 URL 向 Flutter 传递参数</button>
<script type="text/javascript">
var btn = document.getElementById("btn");
btn.addEventListener('click', function () {
//通过URL向flutter传递参数
document.location = "hi://webview?name=geekailab";
}, false)
</script>
</body>
</html>
''';

/// Js向Flutter 传递数据 通过 URL 方式
class Js2FlutterByUrl extends StatefulWidget {
  const Js2FlutterByUrl({super.key});

  @override
  State<Js2FlutterByUrl> createState() => _Js2FlutterByUrlState();
}

class _Js2FlutterByUrlState extends State<Js2FlutterByUrl> {
  late WebViewController webViewController;

  get _loadBtn => FilledButton(
      onPressed: () {
        // H5 通过 URL 向 Flutter 传递数据
        webViewController.loadHtmlString(h5JS2FlutterByUrl);
      },
      child: const Text(
        '加载 H5',
        style: TextStyle(color: Colors.blue),
      ));

  @override
  void initState() {
    super.initState();
    webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
          NavigationDelegate(onNavigationRequest: (NavigationRequest request) {
        if (request.url.startsWith('hi://webview')) {
          // 处理 JS 通过 URL  传递过来的数据
          final String? name = Uri.parse(request.url).queryParameters['name'];
          debugPrint('name = $name');
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('name = $name')));

          return NavigationDecision.prevent; // 不跳转，只接受数据
        }
        // 非约定开头协议的 hi://webview  ，则放行
        return NavigationDecision.navigate;
      }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Js 向 Flutter 传递数据 通过 URL 方式"),
        actions: [_loadBtn],
      ),
      body: WebViewWidget(controller: webViewController),
      // body: _loadBtn,
    );
  }
}
