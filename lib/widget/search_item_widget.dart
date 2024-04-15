import 'package:flutter/material.dart';

import '../model/search_model.dart';

class SearchItemWidget extends StatelessWidget {
  final SearchModel searchModel;
  final SearchItem searchItem;

  const SearchItemWidget(
      {super.key, required this.searchModel, required this.searchItem});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
