import 'package:flutter/material.dart';
import 'discover_cell.dart';

class DiscoverPage extends StatefulWidget {
  @override
  _DiscoverPageState createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  Color _themeColor = Color.fromRGBO(220, 220, 220, 1.0);

  @override
  Widget build(BuildContext context) {
    var subimageName2 = null;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: _themeColor,
          centerTitle: true,
          title: Text(
            "发现",
            style: TextStyle(color: Colors.black),
          ),
          elevation: 0.0, //去掉导航栏底部阴影
        ),
        body: Container(
          color: _themeColor,
          height: 800,
          child: ListView(
            children: [
              DiscoverCell(
                title: "朋友圈",
                imageName: "images/朋友圈.png",
              ),
              SizedBox(
                height: 10,
              ),
              DiscoverCell(
                title: "扫一扫",
                imageName: "images/扫一扫2.png",
              ),
              Row(
                children: [
                  Container(
                    color: Colors.white,
                    height: 0.5,
                    width: 50,
                  ),
                  Container(
                    color: Colors.grey,
                    height: 0.5,
                  )
                ],
              ),
              DiscoverCell(
                title: "摇一摇",
                imageName: "images/摇一摇.png",
              ),
              SizedBox(
                height: 10,
              ),
              DiscoverCell(
                title: "看一看",
                imageName: "images/看一看.png",
              ),
              Row(
                children: [
                  Container(
                    color: Colors.white,
                    height: 0.5,
                    width: 50,
                  ),
                  Container(
                    color: Colors.grey,
                    height: 0.5,
                  )
                ],
              ),
              DiscoverCell(
                title: "搜一搜",
                imageName: "images/搜一搜.png",
              ),
              SizedBox(
                height: 10,
              ),
              DiscoverCell(
                title: "扫一扫",
                imageName: "images/扫一扫2.png",
              ),
              DiscoverCell(
                title: "摇一摇",
                imageName: "images/摇一摇.png",
              ),
              SizedBox(
                height: 10,
              ),
              DiscoverCell(
                title: "购物",
                imageName: "images/购物.png",
                subtitle: '818限时特惠',
                subimageName: 'images/badge.png',
              ),
            ],
          ),
        ));
  }
}
