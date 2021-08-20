import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_wechat_app/pages/discover/discover_child_page.dart';
import 'package:flutter_wechat_app/pages/friends/const.dart';
import 'package:flutter_wechat_app/pages/friends/index_bar.dart';
import 'friends_data.dart';

class FriendsPage extends StatefulWidget {
  @override
  _FriendsPageState createState() => _FriendsPageState();
}

class _FriendsPageState extends State<FriendsPage> {
  final List<Friends> _listDatas = [];

  @override
  void initState() {
    //重写初始化方法
    super.initState();
    //添加更多数据，语法糖.相当于 OC 的 addObjectFromArray，这里是添加了两次
    _listDatas..addAll(datas)..addAll(datas);
//  排序
    _listDatas.sort((Friends a, Friends b) {
      return a.indexLetter!.compareTo(b.indexLetter!);
    });
  }

  final List<Friends> _headerData = [
    Friends(imageUrl: 'images/新的朋友.png', name: '新的朋友'),
    Friends(imageUrl: 'images/群聊.png', name: '群聊'),
    Friends(imageUrl: 'images/标签.png', name: '标签'),
    Friends(imageUrl: 'images/公众号.png', name: '公众号'),
  ];

  Widget _itemForRow(BuildContext context, int index) {
    // 头部的四个 cell
    if (index < _headerData.length) {
      return _FriendCell(
        imageAsset: _headerData[index].imageUrl!,
        name: _headerData[index].name,
      );
    }
    // 如果当前和上一个 cell 的 indexLetter 相同就不显示头
    if (index > 4 &&
        _listDatas[index - 4].indexLetter! ==
            _listDatas[index - 5].indexLetter!) {
      return _FriendCell(
        imageUrl: _listDatas[index - 4].imageUrl,
        name: _listDatas[index - 4].name,
      );
    }
    return _FriendCell(
      imageUrl: _listDatas[index - 4].imageUrl,
      name: _listDatas[index - 4].name,
      groupTitle: _listDatas[index - 4].indexLetter,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: WechatThemeColor,
        title: Text("通讯录"),
        // actions 相当于 iOS 的 navigationBarItem
        actions: [
          GestureDetector(
            child: Container(
              margin: EdgeInsets.only(right: 10),
              child: Image(
                image: AssetImage('images/icon_friends_add.png'),
                width: 25,
              ),
            ),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) =>
                      DiscoverChildPage(title: 'title')));
            },
          )
        ],
      ),
      body: Stack(
        children: [
          // 通讯录列表
          Container(
            child: ListView.builder(
              itemCount: _listDatas.length + _headerData.length,
              itemBuilder: _itemForRow,
            ),
          ),
          // 悬浮检索控件
          IndexBar(),
        ],
      ),
    );
  }
}

class _FriendCell extends StatelessWidget {
  final String? imageUrl;
  final String? name;
  final String? groupTitle;
  final String? imageAsset;

  const _FriendCell(
      {Key? key, this.imageUrl, this.name, this.imageAsset, this.groupTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          // 组头
          Container(
            padding: EdgeInsets.only(left: 10),
            alignment: Alignment.centerLeft,
            height: groupTitle != null ? 30 : 0,
            color: Color.fromRGBO(1, 1, 1, 0.1),
            child: groupTitle != null
                ? Text(
                    groupTitle!,
                    style: TextStyle(color: Colors.grey),
                  )
                : null,
          ),
          // cell content
          Container(
            color: Colors.white,
            child: Row(
              children: [
                // 头像
                Container(
                  width: 34,
                  height: 34,
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6.0),
                      image: DecorationImage(
                          image: imageUrl != null
                              ? NetworkImage(imageUrl!, scale: 1.0)
                              : AssetImage(imageAsset!) as ImageProvider)),
//在最新版本的 flutter，这种写法报错，参考 https://github.com/flutter/flutter/issues/77782#issuecomment-799560559
                  // image: imageUrl != null
                  // ? NetworkImage(imageUrl!, scale: 1.0)
                  // : AssetImage(imageAsset)))
                ), //图片
                // 昵称+底部线条
                Container(
                    width: ScreenWidth(context) - 54,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          height: 53.5,
                          child: Text(
                            name!,
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                        Container(
                            child: Container(
                          height: 0.5,
                          color: WechatThemeColor,
                        ))
                      ],
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
