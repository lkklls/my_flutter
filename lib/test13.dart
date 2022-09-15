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

  GlobalKey<_TextWidgetState> textKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Demo'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            TextWidget(textKey), //需要更新的Text
            FloatingActionButton(
              child: new Text('按钮 $count'),
              onPressed: () {
                //setState(() {});  注释掉只有GlobalKey更新
                count++; // 这里我们只给他值变动，状态刷新交给下面的Key事件
                textKey.currentState!
                    .setText(count); //其实这个count值已经改变了 但是没有重绘所以我们看到的只是我们定义的初始值
              },
            ),
          ],
        ),
      ),
    );
  }
}

//封装的widget
class TextWidget extends StatefulWidget {
  final Key key;

  const TextWidget(this.key);

  @override
  _TextWidgetState createState() => _TextWidgetState();
}

class _TextWidgetState extends State<TextWidget> {
  String text = "0";

  void setText(int count) {
    setState(() {
      text = count.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Text(text);
  }
}
