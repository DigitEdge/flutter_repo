import 'package:flutter/material.dart';
import 'const.dart';

typedef IndexBarCallback = void Function(String str);

class IndexBar extends StatefulWidget {
  // IndexBarCallback可以简写为下面的形式
  // final void Function(String str)? indexBarCallback;
  final IndexBarCallback? indexBarCallback;
  const IndexBar({Key? key, this.indexBarCallback}) : super(key: key);

  @override
  _IndexBarState createState() => _IndexBarState();
}

String getIndex(BuildContext context, Offset globalPosition) {
// 坐标转换
  RenderBox box = context.findRenderObject() as RenderBox;
  // 算出 y值
  double y = box.globalToLocal(globalPosition).dy;
  var itemHieght = ScreenHeight(context) / 2 / INDEX_WORDS.length;
  // ~/ dart 中的相除取整. clamp 保证数组不会越界
  int index = (y ~/ itemHieght).clamp(0, INDEX_WORDS.length - 1);
  return INDEX_WORDS[index];
}

// 带有_的都是内部的，外部不能访问
class _IndexBarState extends State<IndexBar> {
  Color _bgColor = Color.fromRGBO(1, 1, 1, 0.0);
  Color _textColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    List<Widget> words = [];
    for (int i = 0; i < INDEX_WORDS.length; i++) {
      words.add(Expanded(
          child: Text(
        INDEX_WORDS[i],
        style: TextStyle(fontSize: 10, color: _textColor),
      ))); //填充布局
    }

    return Positioned(
        right: 0.0,
        height: ScreenHeight(context) / 2,
        top: ScreenHeight(context) / 8,
        width: 30,
        child: GestureDetector(
          //监听手势区域
          onVerticalDragUpdate: (DragUpdateDetails details) {
            if (widget.indexBarCallback != null) {
              widget
                  .indexBarCallback!(getIndex(context, details.globalPosition));
            }
          },
          onVerticalDragDown: (DragDownDetails details) {
            _bgColor = Color.fromRGBO(1, 1, 1, 0.3);
            _textColor = Colors.white;
            if (widget.indexBarCallback != null) {
              widget
                  .indexBarCallback!(getIndex(context, details.globalPosition));
            }
            setState(() {});
          },
          onVerticalDragEnd: (DragEndDetails details) {
            _bgColor = Color.fromRGBO(1, 1, 1, 0.0);
            _textColor = Colors.black;
            setState(() {});
          },
          child: Container(
            color: _bgColor,
            child: Column(
              children: words,
            ),
          ),
        ));
  }
}

const INDEX_WORDS = [
  '🔍',
  '☆',
  'A',
  'B',
  'C',
  'D',
  'E',
  'F',
  'G',
  'H',
  'I',
  'J',
  'K',
  'L',
  'M',
  'N',
  'O',
  'P',
  'Q',
  'R',
  'S',
  'T',
  'U',
  'V',
  'W',
  'X',
  'Y',
  'Z'
];
