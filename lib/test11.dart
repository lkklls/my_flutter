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
    StateItem('aaaaa'),
    StateItem('bbbbb'),
    StateItem('ccccc'),

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

class StateItem extends StatefulWidget {
  final title;
  StateItem(this.title);
  // StateItem(this.title, {Key? key}) : super(key: key);

  _StateItemState createState() => _StateItemState();
}

class _StateItemState extends State<StateItem> {
  final _color = Color.fromRGBO(
      Random().nextInt(256), Random().nextInt(256), Random().nextInt(256), 1.0);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: 100,
      height: 100,
      color: _color,
      child: Center(
        child: Text(widget.title),
      ),
    );
  }
}
