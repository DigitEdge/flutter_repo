import 'package:flutter/material.dart';
import 'package:flutter_wechat_app/pages/root_page.dart';

// void main() => runApp(MyApp());
void main() {
  //只有一句代码时可以简写为上面的形式，语法糖
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo', //这个属性在 iOS 里面基本没用，在 Android 有用
      theme: ThemeData(
        primarySwatch: Colors.cyan, //导航栏颜色
        highlightColor: Color.fromRGBO(0, 0, 0, 0.0), //去掉底部按钮选中效果
        splashColor: Color.fromRGBO(0, 0, 0, 0.0), //去掉底部按钮选中效果
        cardColor: Color.fromRGBO(1, 1, 1, 0.65), //控制全局菜单（比如 PopupMenu）主题色
      ),
      home: RootPage(),
    );
  }
}
