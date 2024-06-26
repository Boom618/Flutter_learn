import 'package:flutter/material.dart';

import '../util/screen_adapter_helper.dart';
import '../util/view_util.dart';

class ScreenFixPage extends StatefulWidget {
  const ScreenFixPage({Key? key}) : super(key: key);

  @override
  State<ScreenFixPage> createState() => _ScreenFixPageState();
}

class _ScreenFixPageState extends State<ScreenFixPage> {
  @override
  Widget build(BuildContext context) {
    ScreenHelper.init(context);
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Center(
            child: Container(
              width: 200,
              height: 200,
              decoration: const BoxDecoration(color: Colors.blue),
              child: const Text('默认大小'),
            ),
          ),
          hiSpace(mHeight: 50),
          Center(
              child: Container(
            width: 20.5.px,
            height: 200.px,
            decoration: const BoxDecoration(color: Colors.amber),
            child: const Text('适配后大小'),
          ))
        ],
      ),
    );
  }
}
