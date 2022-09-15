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
        body: SizedBox(width: 300, height: 90, child: getListItem()));
  }
}

StatelessWidget getListItem() {
  return Card(
    elevation: 1.5,
    color: Colors.red,
    margin: const EdgeInsets.fromLTRB(60, 12, 6, 0),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(4),
    ),
    child: InkWell(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CircleAvatar(
              backgroundColor: Colors.blue,
              child: Text(
                "1",
                style: TextStyle(color: Colors.white),
              ),
            ),
            const Padding(padding: EdgeInsets.only(left: 16)),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "这个是描述",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 8)),
                  Text(
                    "这个是内容",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
