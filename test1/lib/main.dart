import 'package:flutter/material.dart';

//エントリーポイント(一番最初に呼ばれる関数)
void main() {
    //実行するアプリの指定
    runApp(
        //アプリの基盤を作成
        MaterialApp(
            //home:最初に呼び出したいページの指定
            //Scaffold:アプリの下地を作成
            home:Scaffold(
                body:Text(
                    'Test',
                    style: TextStyle(fontSize: 36)
                )
            )
        )
    );
}

