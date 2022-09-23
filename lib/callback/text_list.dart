import 'package:flutter/material.dart';

typedef _CallBack = void Function(int selectIndex, String selectStr);

class TextList extends StatefulWidget {
  final List? dataArr;
  final _CallBack? callback;

  TextList({Key? key, this.dataArr, this.callback}) : super(key: key);

  @override
  _TextListState createState() {
    return _TextListState();
  }
}

class _TextListState extends State<TextList> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("接口回调列表 "),
      ),
      body: ListView.builder(
        itemCount: widget.dataArr?.length,
        itemBuilder: (BuildContext context, int position) {
          return _itemWidget(context, position);
        },
      ),
    );
  }

  Widget _itemWidget(BuildContext context, int index) {
    return GestureDetector(
      child: Center(
          child: Padding(
        padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Text(widget.dataArr?[index]),
      )),
      onTap: () {
        if (widget.callback != null) {
          widget.callback!(index, widget.dataArr?[index]);
        }
      },
    );
  }
}
