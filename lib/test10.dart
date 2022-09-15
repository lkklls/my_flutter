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
  _keyDemoState createState() => _keyDemoState();
}

class _keyDemoState extends State<keyDemo> {
  List<Widget> items = [
    Itemless(title: 'aaaaa'),
    Itemless(title: 'bbbbb'),
    Itemless(title: 'ccccc'),

    //StateItem('aaaaa',key: ValueKey(1111),),
    //StateItem('bbbbb',key:ValueKey(2222),),
    //StateItem('ccccc',key:ValueKey(3333),),
  ];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('keyDemo'),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: items,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            items.removeAt(0);
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
