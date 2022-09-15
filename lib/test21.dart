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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Demo'),
        ),
        body: Flex(
          direction: Axis.vertical,
          children: [
            Expanded(flex: 0, child: Text("jjdjdjdj")),
            Expanded(flex: 0, child: Text("jjdjdjdj")),
            Expanded(flex: 0, child: Text("jjdjdjdj"))
          ],
        ));
  }

  Widget topWidget() {
    return Flex(
      direction: Axis.vertical,
      children: const [],
    );
  }
}
