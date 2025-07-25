import 'package:flutter/material.dart';

void main() {
  runApp(const Base());
}

class Base extends StatelessWidget {
  const Base({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
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
      backgroundColor: Colors.white, //bodyの背景色

      appBar: AppBar(
        shape: Border(bottom: BorderSide(color: Colors.grey)),
        backgroundColor: Colors.white, //AppBarの背景色
        centerTitle: true,
        //画面左端に表示する内容
        leading: Image.network(
          'https://news.mynavi.jp/article/20240820-3008612/images/102.jpg',
        ),
        title: Center(
          //ネットワーク上の画像を取得
          child: Image.network(
            'https://news.mynavi.jp/article/20240820-3008612/images/101.jpg',
            width: 80.0,
            height:40.0,
          ),
        ),
        //画面右上に表示する内容
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Icon(Icons.settings),
          ),
        ],
      ),

      //メインコンテンツ部分
      //ListView.builder:スクロール可能なリスト(可変式)
      body:ListView.builder(
        itemCount: 10, //要素数

        //要素ごとの処理
        itemBuilder: (context,index){
          
          //Padding:内側に余白を作成
          return Padding(
            //全方向に余白を作成
            padding: const EdgeInsets.all(12.0),

            //横に並べる
            child: Row(
              children: [
                //丸形アイコン
                CircleAvatar(
                  //ネットワーク上の画像をアイコンに設定
                  backgroundImage: NetworkImage('https://news.mynavi.jp/article/20240820-3008612/images/102.jpg'),
                ),
                SizedBox(width: 12,),
                Expanded(
                  child: Column(
                    //mainAxisAlignment:縦軸の配置
                    //crossAxisAlignment:横軸の配置
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '宮本 @miyamoto_dayo',
                        style: TextStyle(fontWeight: FontWeight.bold)
                      ),
                      SizedBox(height:4),
                      Text('xのタイムラインをトレースするためのプロジェクト'),
                      Row(
                        //spaceBetewwn:等間隔に並べる
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.comment_outlined,size:18),
                          Icon(Icons.repeat,size:18),
                          Icon(Icons.favorite_border,size:18),
                          Icon(Icons.bookmark_border,size:18),
                          Icon(Icons.ios_share,size:18),
                        ],  
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        }
      ),

      //画面下部に表示するバー
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white, //bottomNavの背景色

        //４つ以上並べる場合
        type:BottomNavigationBarType.fixed,

        //各要素
        items:[
          BottomNavigationBarItem(icon: Icon(Icons.home),label: 'home'),
          BottomNavigationBarItem(icon: Icon(Icons.search),label: 'search'),
          BottomNavigationBarItem(icon: Icon(Icons.people_outline),label: 'home'),
          BottomNavigationBarItem(icon: Icon(Icons.notifications_none_outlined),label:'notifications'),
          BottomNavigationBarItem(icon: Icon(Icons.mail_outline),label:'mail'),
        ] 
      ),
    );
  }
}
