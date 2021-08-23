import 'package:flutter/material.dart';
import 'chat/chat_page.dart';
import 'discover/discover_page.dart';
import 'friends/friends_page.dart';
import 'mine/mine_page.dart';

class RootPage extends StatefulWidget {
  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  final PageController _pageCtrl = PageController(
    initialPage: 0,
  );
  List<Widget> _pages = [ChatPage(), FriendsPage(), DiscoverPage(), MinePage()];
  int _currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          onTap: (int index) {
            _currentPageIndex = index;
            setState(() {});
            _pageCtrl.jumpToPage(index);
          },
          type: BottomNavigationBarType.fixed,
          selectedFontSize: 12.0, //设置大小，去掉选中的放大效果
          fixedColor: Colors.green,
          currentIndex: _currentPageIndex,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Image(
                  height: 20,
                  width: 20,
                  image: AssetImage('images/tabbar_chat.png'),
                ),
                activeIcon: Image(
                  height: 20,
                  width: 20,
                  image: AssetImage('images/tabbar_chat_hl.png'),
                ),
                label: '微信'),
            BottomNavigationBarItem(
                icon: Image(
                  height: 20,
                  width: 20,
                  image: AssetImage('images/tabbar_friends.png'),
                ),
                activeIcon: Image(
                  height: 20,
                  width: 20,
                  image: AssetImage('images/tabbar_friends_hl.png'),
                ),
                label: '通讯录'),
            BottomNavigationBarItem(
                icon: Image(
                  height: 20,
                  width: 20,
                  image: AssetImage('images/tabbar_discover.png'),
                ),
                activeIcon: Image(
                  height: 20,
                  width: 20,
                  image: AssetImage('images/tabbar_discover_hl.png'),
                ),
                label: '发现'),
            BottomNavigationBarItem(
                icon: Image(
                  height: 20,
                  width: 20,
                  image: AssetImage('images/tabbar_mine.png'),
                ),
                activeIcon: Image(
                  height: 20,
                  width: 20,
                  image: AssetImage('images/tabbar_mine_hl.png'),
                ),
                label: '我'),
          ],
        ),
        body: PageView(
          // 拖动与底部 item 联动
          // onPageChanged: (int index) {
          //   _currentPageIndex = index;
          //   setState(() {});
          // },

          physics: NeverScrollableScrollPhysics(), //禁止拖动
          controller: _pageCtrl, //使用page 处理，保证状态保留可以成功
          children: _pages,
        ),
        // _pages[_currentPageIndex]
      ),
    );
  }
}

/*
* 小部件树
app -> rootPage -> c -> d
**/ 
