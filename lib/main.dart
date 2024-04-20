import 'package:flutter/material.dart';
import 'package:flutter_hi_cache/flutter_hi_cache.dart';
import 'package:get/get.dart';
import 'package:started_flutter/mvvm/binding/inital_binding.dart';
import 'package:started_flutter/mvvm/routes/app_pages.dart';
import 'package:started_flutter/pages/home_page.dart';

import 'dao/login_dao.dart';
import 'h5/js_flutter.dart';
import 'h5/js_flutter_by_url.dart';
import 'http/JsonParsingPage.dart';
import 'http/future_study.dart';
import 'http/http_study.dart';
import 'http/shared_preferences_study.dart';
import 'navigator/tab_navigator.dart';
import 'mvvm/login/views/login_page.dart';
import 'util/screen_adapter_helper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
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
      initialRoute: AppPages.init,
      initialBinding: InitialBinding(),
      getPages: AppPages.routes,
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
