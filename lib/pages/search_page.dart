import 'package:flutter/material.dart';

import '../widget/search_bar_widget.dart';

/// 搜索页面
class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: const Text("搜索"),
      ),
      body: Column(
        children: [
          SearchBarWidget(searchBarType: SearchBarType.normal),
          SearchBarWidget(searchBarType: SearchBarType.home),
          SearchBarWidget(searchBarType: SearchBarType.homeLight),
        ],
      ),
    );
  }
}
