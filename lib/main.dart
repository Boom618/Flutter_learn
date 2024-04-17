import 'package:flutter/material.dart';
import 'package:flutter_hi_cache/flutter_hi_cache.dart';
import 'package:started_flutter/pages/home_page.dart';

import 'dao/login_dao.dart';
import 'h5/js_flutter.dart';
import 'h5/js_flutter_by_url.dart';
import 'http/JsonParsingPage.dart';
import 'http/future_study.dart';
import 'http/http_study.dart';
import 'http/shared_preferences_study.dart';
import 'navigator/tab_navigator.dart';
import 'pages/login_page.dart';
import 'util/screen_adapter_helper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
      // home: const HttpStudy(),
      // home: const JsonParsingPage(),
      // home: const FutureStudy(),
      // home: const SPCounterWidget(),
      // home: const LoginPage(),
      home: FutureBuilder<dynamic>(
        future: HiCache.preInit(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot){
          ScreenHelper.init(context);// 初始化屏幕适配工具
          if (snapshot.connectionState == ConnectionState.done) {
            if (LoginDao.getBoardingPass() == null) {
              return const JsFlutter();
              // return const TabNavigator();
            } else {
              return const TabNavigator();
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
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
