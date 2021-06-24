import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nougyou/shop.dart';

import 'chat.dart';
import 'friend.dart';

class HomePage extends StatefulWidget {
  // 引数からユーザー情報を受け取る
  HomePage(this.user);
  // ユーザー情報
  final User user;
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectIndex = 0;
  List<Widget> widgetList = [
    FriendPage(),
    ChatPage(),
    ShopPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'ホーム',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat_bubble),
              label: 'トーク',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: '買い物',
            )
          ],
          currentIndex: selectIndex,
          onTap: (index) {
            setState(() {
              selectIndex = index;
            });
          }),
      body: widgetList[selectIndex],
    );
  }
}
