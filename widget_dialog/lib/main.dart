import 'dart:io';

import 'package:flutter/material.dart';

void main() {
  runApp(const Base());
}

class Base extends StatelessWidget {
  const Base({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home:DialogPage()
    );
  }
}

class DialogPage extends StatefulWidget {
  const DialogPage({super.key});

  @override
  State<DialogPage> createState() => _DialogPageState();
}

class _DialogPageState extends State<DialogPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ダイアログの基礎'),
      ),
      //画面中央にボタンを表示
      body:Center(
        child:ElevatedButton(
          onPressed: (){
            //ダイアログの表示
            showDialog(
              context: context, 
              builder: (context){
                //表示内容
                return AlertDialog(
                  backgroundColor: Colors.white,
                    title: Center(
                      child: Text('アカウント削除',style:TextStyle(fontWeight:FontWeight.bold))
                    ),
                    //コンテンツ部分
                    content: Column(
                      //内容に合わせて最小限の高さになる
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('削除すると以下の情報がすべて失われます'),
                        SizedBox(height: 24), //縦24ピクセル分の透明の箱
                        //見た目を変える事の出来る箱
                        Container(
                          //見た目の変更
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(55, 158, 158, 158),
                            borderRadius: BorderRadius.circular(10), //角度
                          ),

                          //余白の作成
                          padding: EdgeInsets.only(left: 12),
                          height: 150, //コンテナの高さ
                          width: 200, //コンテナの幅

                          child:Column(
                            mainAxisAlignment: MainAxisAlignment.center,  //中央
                            crossAxisAlignment: CrossAxisAlignment.start, //左端
                            children: [
                              Text('・プロフィール情報'),
                              Text('・メッセージ'),
                              Text('・お気に入り'),
                              Text('・フォロー/フォロワー'),
                            ],
                          ),
                        ),
                      ],
                    ),
                    actions: [
                      //横に並べる
                      Row(
                        //等間隔
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
                            //見た目の変更
                            style: ElevatedButton.styleFrom(
                              //最小サイズの設定
                              minimumSize: Size(120, 50),
                              backgroundColor: Colors.white, //背景色
                              foregroundColor:Colors.black, //文字色
                              side: BorderSide(),
                              //角丸
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              )
                            ),
                            onPressed: (){
                              Navigator.pop(context);
                            }, 
                            child: Text('キャンセル')
                          ),
                          ElevatedButton(
                            //見た目の変更
                            style: ElevatedButton.styleFrom(
                              //最小サイズの設定
                              minimumSize: Size(120, 50),
                              backgroundColor: const Color.fromARGB(255, 255, 126, 117), //背景色
                              foregroundColor:Colors.white, //文字色
                              //角丸
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              )
                            ),
                            onPressed: (){
                              //タスクキル
                              exit(0);
                            }, 
                            child: Text('削除')
                          ),
                        ],
                      )
                    ],
                ); 
              }
            );
          }, 
          child: Text('ダイアログの表示')
        )
      )
    );
  }
}