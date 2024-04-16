import 'dart:convert';

import 'package:flutter/material.dart';

/// 旅拍tab页, 这是一个页面，所以是一个有状态的 Widget
class TravelTabPage extends StatefulWidget {
  final String groupChannelCode;

  const TravelTabPage({super.key, required this.groupChannelCode});

  @override
  State<StatefulWidget> createState() => _TravelTabPage();
}

class _TravelTabPage extends State<TravelTabPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(

      ),
    );
  }
}
