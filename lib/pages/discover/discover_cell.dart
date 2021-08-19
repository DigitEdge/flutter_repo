import 'package:flutter/material.dart';
import 'discover_child_page.dart';

class DiscoverCell extends StatefulWidget {
  final String? title;
  final String? subtitle;
  final String? imageName;
  final String? subimageName;

// 构造函数
  const DiscoverCell(
      {Key? key,
      required this.title,
      required this.imageName,
      this.subtitle,
      this.subimageName})
      : super(key: key);

  // DiscoverCell(String title) {
  // this.title = title,
  // }

  @override
  _DiscoverCellState createState() => _DiscoverCellState();
}

class _DiscoverCellState extends State<DiscoverCell> {
  Color _currentColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      //给 container 添加点击手势
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) =>
                DiscoverChildPage(title: widget.title!))); //用了语法糖
        // MaterialPageRoute(builder: (BuildContext context) {
        //   return DiscoverChildPage(title: title!);
        // }),
        setState(() {
          _currentColor = Colors.white;
        });
      },
      onTapDown: (TapDownDetails details) {
        setState(() {
          _currentColor = Colors.grey;
        });
      },
      onTapCancel: () {
        setState(() {
          _currentColor = Colors.white;
        });
      },
      child: Container(
        padding: EdgeInsets.all(10),
        color: _currentColor,
        height: 54,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // left
            Container(
              child: Row(
                children: [
                  // 图标
                  Image(
                    image: AssetImage(widget.imageName!),
                    width: 20,
                  ),
                  // 间距
                  SizedBox(
                    width: 15,
                  ),
                  // 标题
                  Text(widget.title!),
                ],
              ),
            ),
            // right
            Container(
              child: Row(
                children: [
                  Text(
                    widget.subtitle != null ? widget.subtitle! : '',
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                  widget.subimageName != null
                      ? Container(
                          //小圆点，放在 container 方便布局
                          child: Image(
                            image: AssetImage(widget.subimageName!),
                            width: 15,
                          ),
                          margin: EdgeInsets.only(left: 10, right: 10),
                        )
                      : Container(),
                  Image(
                    image: AssetImage('images/icon_right.png'),
                    width: 15,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
