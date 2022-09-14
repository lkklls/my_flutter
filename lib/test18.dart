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
        body: Column(
          children: [titleWidget(), getListViewWidget()],
        ));
  }

  Flex titleWidget() {
    return Flex(
      direction: Axis.horizontal,
      children: [
        Expanded(
            flex: 1,
            child: Container(
              height: 30,
              color: Colors.blue,
              child: const Text("jdjdkdkkdkdkkdkk"),
            ))
      ],
    );
  }

  Widget getListViewWidget() {
    return Expanded(
      child: ListView.builder(itemBuilder: (BuildContext context, int index) {
        return ListTile(title: Text("$index"));
      }),
    );
  }
}
