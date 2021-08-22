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

int getIndex(BuildContext context, Offset globalPosition) {
// 坐标转换
  RenderBox box = context.findRenderObject() as RenderBox;
  // 算出 y值
  double y = box.globalToLocal(globalPosition).dy;
  var itemHieght = ScreenHeight(context) / 2 / INDEX_WORDS.length;
  // ~/ dart 中的相除取整. clamp 保证数组不会越界
  int index = (y ~/ itemHieght).clamp(0, INDEX_WORDS.length - 1);
  return index;
}

// 带有_的都是内部的，外部不能访问
class _IndexBarState extends State<IndexBar> {
  var _selectedIndex = -1;
  Color _bgColor = Color.fromRGBO(1, 1, 1, 0.0);
  Color _textColor = Colors.black;

  double _indicatorY = 0.0;
  String _indicatorText = 'A ';
  bool _indicatorHidden = true;

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
        width: 120,
        child: Row(
          children: [
            Container(
              alignment: Alignment(0, _indicatorY),
              width: 100,
              child: _indicatorHidden == true
                  ? null
                  : Stack(
                      alignment: Alignment(-0.2, 0.0),
                      children: [
                        Image(
                          image: AssetImage('images/气泡.png'),
                          width: 60,
                        ),
                        Text(
                          _indicatorText,
                          style: TextStyle(fontSize: 35, color: Colors.white),
                        )
                      ],
                    ),
            ),
            GestureDetector(
              child: Container(
                width: 20,
                color: _bgColor,
                child: Column(
                  children: words,
                ),
              ),
              //监听手势区域
              onVerticalDragUpdate: (DragUpdateDetails details) {
                // 计算外界回调
                int idx = getIndex(context, details.globalPosition);
                if (widget.indexBarCallback != null) {
                  if (_selectedIndex != idx) {
                    _selectedIndex = idx;
                    setState(() {});
                    widget.indexBarCallback!(INDEX_WORDS[idx]);
                  }
                }
                // 内部气泡的显示
                _indicatorText = INDEX_WORDS[idx];
                _indicatorY = 2.2 / INDEX_WORDS.length * idx - 1.1;
                _indicatorHidden = false;
                setState(() {});
              },
              onVerticalDragDown: (DragDownDetails details) {
                // _bgColor = Color.fromRGBO(1, 1, 1, 0.3);
                // _textColor = Colors.white;
                if (widget.indexBarCallback != null) {
                  // 计算外界回调

                  int idx = getIndex(context, details.globalPosition);
                  if (_selectedIndex != idx) {
                    _selectedIndex = idx;
                    _indicatorText = INDEX_WORDS[idx];
                    _indicatorY = 2.2 / INDEX_WORDS.length * idx - 1.1;
                    _indicatorHidden = false;

                    setState(() {
                      _bgColor = Color.fromRGBO(1, 1, 1, 0.5);
                      _textColor = Colors.white;
                    });
                    widget.indexBarCallback!(INDEX_WORDS[idx]);
                  }
                }
// 内部气泡的显示
              },
              onVerticalDragEnd: (DragEndDetails details) {
                _bgColor = Color.fromRGBO(1, 1, 1, 0.0);
                _textColor = Colors.black;
                _selectedIndex = -1;
                _indicatorHidden = true;
                setState(() {});
              },
            ),
          ],
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
