import 'package:flutter/material.dart';

import '../dao/travel_dao.dart';
import '../model/travel_category_model.dart';

/// 旅拍页面
class TravelPage extends StatefulWidget {
  const TravelPage({super.key});

  @override
  State<TravelPage> createState() => _TravelPageState();
}

class _TravelPageState extends State<TravelPage> {
  List<TravelTab> tabs = [];
  TravelCategoryModel? travelTabModel;

  @override
  void initState() {
    super.initState();
    TravelDao.getCategory().then((TravelCategoryModel? model) {
      setState(() {
        travelTabModel = model;
        tabs = model?.tabs ?? [];
      });
    }).catchError((e) {
      debugPrint(e.toString());
    });
  }

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
