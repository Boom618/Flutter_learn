import 'package:flutter/material.dart';
import 'package:flutter_hi_cache/flutter_hi_cache.dart';
import 'package:started_flutter/mvvm/main/views/bottom_tab_view.dart';

import '../../../dao/login_dao.dart';
import '../../../h5/js_flutter.dart';
import '../../../util/screen_adapter_helper.dart';


/// 主页
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<dynamic>(
        future: HiCache.preInit(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot){
          ScreenHelper.init(context);// 初始化屏幕适配工具
          if (snapshot.connectionState == ConnectionState.done) {
            if (LoginDao.getBoardingPass() == null) {
              return const JsFlutter();
              // return const TabNavigator();
            } else {
              return const BottomTabView();
              // return const HomePage();
            }
          } else {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        }
    );
  }
}
