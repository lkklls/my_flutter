import 'dart:math';

import 'package:flutter/widgets.dart';

class Itemless extends StatelessWidget {
  final title;
  Itemless({this.title});
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
        child: Text(title),
      ),
    );
  }
}
