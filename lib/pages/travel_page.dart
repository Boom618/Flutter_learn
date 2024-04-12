import 'package:flutter/material.dart';

/// 旅拍页面
class TravelPage extends StatefulWidget {
  const TravelPage({super.key});

  @override
  State<TravelPage> createState() => _TravelPageState();
}

class _TravelPageState extends State<TravelPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("旅拍"),
      ),
      body: Text("旅拍"),
    );
  }
}
