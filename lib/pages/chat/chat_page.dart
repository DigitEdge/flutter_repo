import 'package:flutter/material.dart';
import 'package:flutter_wechat_app/pages/friends/const.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("微信"),
        backgroundColor: WechatThemeColor,
        actions: [
          Container(
            margin: EdgeInsets.only(right: 10),
            child: PopupMenuButton(
                offset: Offset(0, 60.0),
                child: Image(
                  image: AssetImage('images/圆加.png'),
                  width: 35,
                ),
                itemBuilder: _buildPopupMenuItem),
          ),
        ],
      ),
      body: Center(
        child: Text('微信页面'),
      ),
    );
  }

  List<PopupMenuItem> _buildPopupMenuItem(BuildContext context) {
    return [
      _buideItem('images/发起群聊.png', '发起群聊'),
      _buideItem('images/添加朋友.png', '添加朋友'),
      _buideItem('images/扫一扫1.png', '扫一扫'),
      _buideItem('images/收付款.png', '收付款')
    ];
  }

  PopupMenuItem _buideItem(String imgAss, String title) {
    return PopupMenuItem(
      child: Row(
        children: [
          Image(
            image: AssetImage(imgAss),
            width: 20,
          ),
          Container(
            width: 20,
          ),
          Text(
            title,
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
