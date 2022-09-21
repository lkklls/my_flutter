import 'dart:math';

import 'package:flutter/material.dart';

import 'view/Itemless.dart';

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
        primarySwatch: Colors.green,
      ),
      home: keyDemo(),
    );
  }
}

class keyDemo extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<keyDemo> {
  int count = 0;
  int a = 1;
  int b = 1;

  StateSetter? _reloadTextSetter;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Demo'),
        ),
        body: Column(
          children: [
            Row(
              children: <Widget>[
                ElevatedButton(
                  onPressed: () => setState(() => {a++}), // 点击的时候让 a 自增
                  child: Text("我想局部刷新 a 自增"),
                ),
                StatefulBuilder(
                    builder: (BuildContext context, StateSetter stateSetter) {
                  _reloadTextSetter = stateSetter;
                  return ElevatedButton(
                      onPressed: () {
                        b++;
                        _reloadTextSetter!(() {});
                      },
                      child: Text("我想局部刷新 b 自增$b"));
                }),
              ],
            ),
            Row(
              children: <Widget>[
                Text("当前 a 的值：$a"),
                Text("当前 b 的值：$b"),
              ],
            ),
          ],
        ));
  }
}
