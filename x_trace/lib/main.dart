import 'package:flutter/material.dart';

void main() {
  runApp(const Base());
}

class Base extends StatelessWidget {
  const Base({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home:TimelinePage()
    );
  }
}

//Xのタイムラインページを作成するクラス
class TimelinePage extends StatelessWidget {
  const TimelinePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white, //AppBarの背景色
        title: Center(
          //ネットワーク上の画像を取得
          child: Image.network(
            'https://news.mynavi.jp/article/20240820-3008612/images/101.jpg',
            width: 80.0,
            height:40.0,
          ),
        ),
      ),
      //画面下部に表示するバー
      bottomNavigationBar: BottomNavigationBar(
        //各要素
        items:[
          BottomNavigationBarItem(icon: Icon(Icons.home),label: 'home'),
          BottomNavigationBarItem(icon: Icon(Icons.search),label: 'search'),
          BottomNavigationBarItem(icon: Icon(Icons.people),label: 'home'),
        ] 
      ),
    );
  }
}
