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
  List<Chat> _datas = [];
  bool _cancelConnect = false;

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

    getDatas()
        .then((List<Chat> datas) {
          if (!_cancelConnect) {
            setState(() {
              _datas = datas;
            });
          }
        })
        .catchError((e) {
          _cancelConnect = true;
          print(e);
        })
        .whenComplete(() {
          print('数据处理完毕');
        })
        .timeout(Duration(seconds: 10))
        .catchError((timeOut) {
          _cancelConnect = true;
          print('请求超时${timeOut}');
        });
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
        child: _datas.length == 0
            ? Center(
                child: Text('Loading...'),
              )
            : ListView.builder(
                itemCount: _datas.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(_datas[index].name),
                    subtitle: Container(
                      height: 20,
                      width: 20,
                      child: Text(
                        _datas[index].message,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(_datas[index].imageUrl),
                    ),
                  );
                },
              ),
      ),

      // 这种方式，每次进来页面都会请求一次
      // FutureBuilder(
      //   future: getDatas(),
      //   builder: (BuildContext context, AsyncSnapshot snapShot) {
      //     if (snapShot.connectionState == ConnectionState.waiting) {
      //       return Center(
      //         child: Text('Loading...'),
      //       );
      //     } else {
      //       return ListView(
      //         children: snapShot.data.map<Widget>((item) {
      //           return ListTile(
      //             title: Text(item.name),
      //             subtitle: Container(
      //               height: 20,
      //               width: 20,
      //               child: Text(item.message),
      //             ),
      //             leading: CircleAvatar(
      //               backgroundImage: NetworkImage(item.imageUrl),
      //             ),
      //           );
      //         }).toList(),
      //       );
      //     }
      //   },
      // ), //专门用来做异步渲染
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
