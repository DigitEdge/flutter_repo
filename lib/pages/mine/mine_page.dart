import 'package:flutter/material.dart';
import 'package:flutter_wechat_app/pages/discover/discover_cell.dart';
import 'package:flutter_wechat_app/pages/friends/const.dart';

class MinePage extends StatefulWidget {
  const MinePage({Key? key}) : super(key: key);

  @override
  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {
  Widget headerWidget() {
    return Container(
      height: 200,
      color: Colors.white,
      child: Container(
        margin: EdgeInsets.only(top: 100),
        padding: EdgeInsets.all(10),
        child: Container(
          // padding: EdgeInsets.all(5),
          child: Row(
            children: [
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                    //装饰器，只对当前 container 起作用，如果设置图片圆角，要使用装饰器的图片属性进行设置

                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                        image: AssetImage('images/Hank.png'),
                        fit: BoxFit.cover)),
              ), //头像
              Expanded(
                //填充布局
                child: Container(
                  // MediaQuery.of(context).size.width 屏幕宽度
                  // width: MediaQuery.of(context).size.width - 100,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 10),
                        alignment: Alignment.centerLeft,
                        height: 35,
                        child: Text(
                          'Hank',
                          style: TextStyle(fontSize: 17, color: Colors.black),
                        ),
                      ), //昵称
                      Container(
                        padding: EdgeInsets.only(left: 10),
                        height: 35,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '微信号：1234abc',
                              style:
                                  TextStyle(fontSize: 17, color: Colors.grey),
                            ),
                            Image(
                              image: AssetImage('images/icon_right.png'),
                              width: 15,
                            )
                          ],
                        ),
                      ), //账号
                    ],
                  ),
                ),
              ) //头像右边的文字部分
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Container(
                color: WechatThemeColor,
                child: MediaQuery.removePadding(
                  //移除刘海屏手机的顶部安全区，flutter 内部处理的
                  removeTop: true,
                  context: context,
                  child: ListView(
                    children: [
                      headerWidget(),
                      // Container(
                      //   color: Colors.white,
                      //   height: 200,
                      //   child: Container(
                      //     margin: EdgeInsets.only(top: 80, left: 10),
                      //     child: Row(
                      //       children: [
                      //         Image(
                      //           image: AssetImage('images/Hank.png'),
                      //           width: 60,
                      //         ),
                      //         SizedBox(
                      //           width: 10,
                      //         ),
                      //         Column(
                      //           mainAxisAlignment: MainAxisAlignment.center,
                      //           children: [
                      //             Text(
                      //               'data',
                      //               style: TextStyle(fontSize: 20),
                      //             ),
                      //             SizedBox(
                      //               height: 20,
                      //             ),
                      //             Text(
                      //               'data',
                      //               style: TextStyle(
                      //                   color: Colors.grey, fontSize: 16),
                      //             )
                      //           ],
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      // ),
                      SizedBox(
                        height: 10,
                      ),
                      DiscoverCell(title: '支付', imageName: 'images/微信支付.png'),
                      SizedBox(
                        height: 10,
                      ),
                      DiscoverCell(title: '收藏', imageName: 'images/微信收藏.png'),
                      Row(
                        children: [
                          Container(
                            color: Colors.white,
                            height: 0.5,
                            width: 40,
                          ),
                          Container(
                            height: 0.5,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                      DiscoverCell(title: '相册', imageName: 'images/微信相册.png'),
                      Row(
                        children: [
                          Container(
                            color: Colors.white,
                            height: 0.5,
                            width: 40,
                          ),
                          Container(
                            height: 0.5,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                      DiscoverCell(title: '卡包', imageName: 'images/微信卡包.png'),
                      Row(
                        children: [
                          Container(
                            color: Colors.white,
                            height: 0.5,
                            width: 40,
                          ),
                          Container(
                            height: 0.5,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                      DiscoverCell(title: '表情', imageName: 'images/微信表情.png'),
                      SizedBox(
                        height: 10,
                      ),
                      DiscoverCell(title: '设置', imageName: 'images/微信设置.png'),
                    ],
                  ),
                )), //列表
            Container(
              margin: EdgeInsets.only(top: 40, right: 10),
              height: 25,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [Image(image: AssetImage('images/相机.png'))],
              ),
            ), //相机
          ],
        ),
      ),
    );
  }
}
