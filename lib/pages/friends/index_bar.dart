import 'package:flutter/material.dart';

import 'const.dart';

class IndexBar extends StatefulWidget {
  @override
  _IndexBarState createState() => _IndexBarState();
}

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
          onVerticalDragDown: (DragDownDetails details) {
            _bgColor = Color.fromRGBO(1, 1, 1, 0.3);
            _textColor = Colors.white;
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
