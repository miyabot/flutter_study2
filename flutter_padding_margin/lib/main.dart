import 'package:flutter/material.dart';

void main() {
  runApp(const Base());
}

class Base extends StatelessWidget {
  const Base({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home:HomePage()
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar:画面上部に表示するバー
      appBar: AppBar(
        title: Text('PaddingとMarginの違い'),
        backgroundColor: Colors.blue,
      ),
      body:Center(
        child:Container(
          //padding:コンテナの内側に16px分の余白を作成
          padding:const EdgeInsets.all(16.0),
          //それぞれの方向に対して余白を指定
          //padding:const EdgeInsets.fromLTRB(16.0, 16.0, 0, 0),
          width: 300.0,
          height:300.0,
          color: Colors.blue,
          child:Container(
            //margin:コンテナの外側に16px分の余白を作成
            margin: EdgeInsets.all(16.0),
            color: Colors.white,
            child: Text('margin',style: TextStyle(fontSize: 36),),
          )
        )
      )
    );
  }
}