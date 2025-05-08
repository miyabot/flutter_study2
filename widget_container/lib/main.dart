import 'package:flutter/material.dart';

void main() {
  //実行するアプリの指定
  runApp(
    //アプリの基盤作成
    MaterialApp(
      //下地を作成
      home:Scaffold(

        //Center:中央に寄せる
        body:Center(
          //Container:見た目を変えることができる箱
          //childに指定したwidgetが中央に寄せられる
          child:Container(
            color: Colors.red,//色
            width: 300, //横幅
            height: 200,//縦幅
            child:Center(
              child: Text('コンテナの中')
            )
          )
        )
        
        
      )
    )
  );
}

