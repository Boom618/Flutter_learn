import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// 基于 shared_preferences 实现计数器
class SPCounterWidget extends StatefulWidget {
  const SPCounterWidget({super.key});

  @override
  State<SPCounterWidget> createState() => _SPCounterWidgetState();
}

class _SPCounterWidgetState extends State<SPCounterWidget> {
  String countString = "";
  String localCount = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('基于 shared_preferences 实现计数器'),
      ),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: _incrementCounter, child: Text('Increment Counter')),
          ElevatedButton(
              onPressed: _getCounter, child: const Text('Get Counter')),
          Text('SharedPreferences 计数器: $countString'),
          Text(
            'result：$localCount',
            style: const TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }

  _incrementCounter() async {
    final prefs = await SharedPreferences.getInstance();
    int counter = (prefs.getInt('counter') ?? 0) + 1;
    setState(() {
      countString = '点击了 $counter 次';
    });
    await prefs.setInt('counter', counter);
  }

  _getCounter() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      localCount = prefs.getInt('counter').toString();
    });
  }
}
