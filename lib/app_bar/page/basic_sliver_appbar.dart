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
  double scrollOffset = 0;
  double maxOffset = 200;

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
      //backgroundColor: Colors.red,
      expandedHeight: 390,
      floating: true,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          color: Colors.red,
        ),
        title: Container(
          height: 220,
          color: Colors.brown,
          alignment: Alignment.bottomCenter,
          child: Container(
            color: Colors.green,
            width: getScaleWidth(),
            height: getScaleWidth(),
            alignment: Alignment.bottomRight,
            child: Image.asset('assets/images/coast.jpg',
                fit: BoxFit.fitWidth,
                height: getScaleWidth(),
                width: getScaleWidth()),
          ),
          // child: Padding(
          //     padding: EdgeInsets.fromLTRB(16, 30, 16, 0),
          //     child: Image.asset('assets/images/coast.jpg',
          //         fit: BoxFit.contain,
          //         height: getScaleWidth(),
          //         width: getScaleWidth())),
        ),
        centerTitle: true,
        titlePadding: EdgeInsets.fromLTRB(0, 34, 0, 0),
      ),
      //title: Text('My App Bar'),
      leading: Icon(Icons.arrow_back),
      actions: [
        Icon(Icons.settings),
        SizedBox(width: 12),
      ],
    );
  }

  double topImageWidth() {
    double tempWidth = 0;
    double offset = scrollOffset / maxOffset;
    double mScale = 1.0 - offset;
    var width = topScaleImageHeight * mScale;
    print("getScaleWidth-====$width=====$offset=====$mScale====$scrollOffset");
    if (width < 80) {
      tempWidth = 80;
    } else {
      tempWidth = width;
    }
    print("tempWidth====$tempWidth");
    return tempWidth;
  }

  double getScaleWidth() {
    double tempWidth = 0;
    double offset = scrollOffset / maxOffset;
    double mScale = 1.0 - offset;
    var width = topScaleImageHeight * mScale;
    print("getScaleWidth-====$width=====$offset=====$mScale====$scrollOffset");
    if (width < 80) {
      tempWidth = 80;
    } else {
      tempWidth = width;
    }
    print("tempWidth====$tempWidth");
    return tempWidth;
  }
}
