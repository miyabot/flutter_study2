import 'package:flutter/material.dart';

//エントリーポイント
void main() {
  //実行するアプリの指定
  runApp(
    //アプリの基盤を作成
    MaterialApp(
      //アプリの下地を作成
      home:Scaffold(
        //中央に寄せる
        body:Center(
          //Image:画像の表示
          //asset:ローカルに保存している画像を表示
          //child: Image.asset('images/dog_akitainu.png'),

          //network:ネットワーク上の画像を表示
          child:Image.network('https://www.kobedenshi.ac.jp/assets/img/info/campus/img_campus01.jpg'),
        )
      )
    )
  );
}

