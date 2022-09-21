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
  int _counter = 0;

  GlobalKey<_TextWidgetState> textKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("kdkdkkdkdk"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:_counter===$_counter',
            ),
            TextWidget(textKey), // 需要更新的Text
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _counter++; // 这里我们只给他值变动，状态刷新交给下面的key事件
          textKey.currentState
              ?.onPressed(_counter); //这个counter的值已经改变了，但是没有重绘所以我们看到的知识我们定义的初始值
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class TextWidget extends StatefulWidget {
  final Key key;
  const TextWidget(this.key);
  @override
  _TextWidgetState createState() => _TextWidgetState();
}

class _TextWidgetState extends State<TextWidget> {
  String _text = "0";
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        _text,
        style: TextStyle(fontSize: 20),
      ),
    );
  }

  void onPressed(int count) {
    setState(() {
      _text = count.toString();
    });
  }
}
