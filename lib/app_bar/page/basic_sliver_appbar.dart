import 'dart:ui';

import 'package:flutter/material.dart';
import '/app_bar/widget/image_widget.dart';

class BasicSliverAppBar extends StatefulWidget {
  const BasicSliverAppBar({super.key});

  @override
  _BasicSliverAppBarState createState() => _BasicSliverAppBarState();
}

class _BasicSliverAppBarState extends State<BasicSliverAppBar> {
  ScrollController _controller = ScrollController(initialScrollOffset: 300);
  var topScaleImageWidth = 220;
  var topScaleImageHeight = 220;
  var topScale = 1.0;
  double expandedHeight = 390;
  double smallestWidth = 40;
  double scrollOffset = 0;
  double maxOffset = 400;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      scrollOffset = _controller.offset;
      print("监听到滚动.... ${_controller.offset}");
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Stack(
          children: [
            CustomScrollView(
              controller: _controller,
              slivers: [
                appBarLayout(),
                buildImages(),
              ],
            ),
          ],
        ),
      );

  Widget buildImages() => SliverToBoxAdapter(
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          primary: false,
          shrinkWrap: true,
          itemCount: 8,
          itemBuilder: (context, index) => ImageWidget(index: index),
        ),
      );

  Widget appBarLayout() {
    return SliverAppBar(
      backgroundColor: Colors.black,
      expandedHeight: expandedHeight,
      floating: true,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        background: ImageFiltered(
          imageFilter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
          child: Image.asset('assets/images/coast.jpg',
              fit: BoxFit.cover, height: expandedHeight),
        ),
        title: Container(
          height: 220,
          color: Colors.transparent,
          alignment: Alignment.bottomCenter,
          child: Container(
            width: getScaleWidth(),
            height: getScaleWidth(),
            alignment: Alignment.bottomRight,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black, //底色,阴影颜色
                  offset: Offset(0, 0), //阴影位置,从什么位置开始
                  blurRadius: 0.5, // 阴影模糊层度
                  spreadRadius: 0, //阴影模糊大小
                )
              ],
            ),
            child: Image.asset('assets/images/coast.jpg',
                fit: BoxFit.fitWidth,
                height: getScaleWidth(),
                width: getScaleWidth()),
          ),
        ),
        centerTitle: true,
        titlePadding: EdgeInsets.fromLTRB(0, 34, 0, 10),
      ),
      //title: Text('My App Bar'),
      leading: Icon(Icons.arrow_back),
      actions: [
        Icon(Icons.settings),
        SizedBox(width: 12),
      ],
    );
  }

  double getScaleWidth() {
    double tempWidth = 0;
    double offset = scrollOffset / maxOffset;
    print(
        "scrollOffset=====$scrollOffset===maxOffset==$maxOffset===offset====$offset");
    double mScale = 1.0 - offset;
    var width = topScaleImageHeight * mScale;
    print("getScaleWidth-====$width=====$offset=====$mScale====$scrollOffset");
    if (width < smallestWidth) {
      tempWidth = smallestWidth;
    } else {
      tempWidth = width;
    }
    print("tempWidth====$tempWidth");
    return tempWidth;
  }
}
