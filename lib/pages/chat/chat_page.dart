import 'package:flutter/material.dart';
import 'package:flutter_wechat_app/pages/chat/chat.dart';
import 'package:flutter_wechat_app/pages/friends/const.dart';
import 'package:flutter_wechat_app/pages/friends/friends_data.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  void initState() {
    super.initState();
    // final chat = {
    //   'name': '张三',
    //   'name': '张三',
    // };
    // Map 转json
    // final chatJson = json.encode(chat);
    // print(chatJson);
    // json 转 Map
    // final newChat = json.decode(chatJson);
    // print(newChat is Map);

    getDatas().then((value) {
      print(datas);
    }).catchError(
      print('object');
    );
  }

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
      body: Container(
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return Text('data');
          },
        ),
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

//  Future<T>, 可能有值，也可能没有值
  Future<List<Chat>> getDatas() async {
    final response = await http.get(
      Uri.parse('http://rap2api.taobao.org/app/mock/data/2056667'),
    );
    if (response.statusCode == 200) {
// 获取响应数据，先转成 Map
      final responseBody = json.decode(response.body);
// 转换成 model
      List<Chat> chartList = responseBody['chat_list'].map<Chat>((item) {
        //遍历
        return Chat.fromJson(item);
      }).toList();
      return chartList;
    } else {
      throw Exception('statusCode:${response.statusCode}');
    }
  }
}
