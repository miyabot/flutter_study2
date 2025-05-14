import 'package:flutter/material.dart';

void main() {

  //カウンタ変数
  int cnt = 0;

  runApp(
    MaterialApp(
      home:Scaffold(
        //画面上部の設計
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text('AppBarの基礎'),
        ),
        //中身の設計
        body:Center(
          //縦に並べる
          child:Column(
            //中央に寄せる
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //カウンタ変数の表示
              Text('$cnt',style: TextStyle(fontSize: 72),),

              //文字のみのbutton
              TextButton(
                //押された時に呼ばれる
                onPressed: (){
                  cnt++;
                  //デバッグコンソールに表示される内容
                  debugPrint('cnt:$cnt');
                }, 
                //ボタンの中に表示するWidgetを決める
                child: Text('ボタン１')
              ),
              //外枠あり
              OutlinedButton(
                //押された時に呼ばれる
                onPressed: (){
                  //デバッグコンソールに表示される内容
                  debugPrint('ボタン２が押された');
                }, 
                //ボタンの中に表示するWidgetを決める
                child: Text('ボタン２')
              ),
              //外枠＋影付き
              ElevatedButton(
                //見た目のカスタマイズ
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    //角の形を変える
                    borderRadius: BorderRadius.circular(0)
                  )
                ),

                //押された時に呼ばれる
                onPressed: (){
                  //デバッグコンソールに表示される内容
                  debugPrint('ボタン３が押された');
                }, 
                //ボタンの中に表示するWidgetを決める
                child: Text('ボタン３')
              ),
            ],
          )
        )
      )
    )
  );
}

