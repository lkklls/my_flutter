import 'package:flutter/material.dart';
import 'text_list.dart';

/**
 *
 *  创建人：xuqing
 *  创建时间：2020年12月7日10:03:31
 *  类是说明：data 接口回调测试类
 *
 *
 *
 */

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);
  @override
  _HomePageState createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  List datalist = [];
  @override
  void initState() {
    super.initState();
    for (var i = 0; i < 20; i++) {
      datalist.add("第几$i条数据");
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return TextList(
      dataArr: datalist,
      callback: (index, str) {
        print("indexe" + index.toString());
        print("str" + str);
      },
    );
  }
}
