import 'package:flutter/material.dart';

void main() {
  //実行するアプリの選択
  runApp(const Base());
}

//基盤を作成するクラス
class Base extends StatelessWidget {
  const Base({super.key});

  //処理はbuildの中に書く
  @override
  Widget build(BuildContext context) {
    //MaterialApp：基盤の作成
    return const MaterialApp(
      //home:最初に呼び出したいページ
      home:HomePage()
    );
  }
}

//パーツを配置していくためのクラス
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    //アプリの下地を作成
    return Scaffold(
      //body:コンテンツの表示部分
      //Column:widgetを縦に並べる
      //Row:widgetを横に並べる
      body:Center(
        child: SizedBox( //サイズの情報を持った透明の箱
          width: 300.0, //横幅
          height: 300.0,//縦幅
          child: Row(
            children: [
              //Flexible:子widgetが利用可能なスペースを埋めるように拡大する
              //Flexible:子widgetサイズを柔軟に変更可能
              //Expanded:子widgetサイズを柔軟に変更不可
              
              Flexible(
                flex:1, //比率
                child: Container(color: Colors.blue)
              ),
              Flexible(
                flex:1, //比率
                child: Container(color: Colors.yellow,)
              ),
              Flexible(
                flex:1, //比率
                child: Container(color: Colors.red,)
              ),
            ],
          ),
        ),
      )
    );
  }
}
