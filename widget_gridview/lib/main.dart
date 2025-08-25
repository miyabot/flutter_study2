import 'package:flutter/material.dart';

void main() {
  runApp(const Base());
}

class Base extends StatelessWidget {
  const Base({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('GridViewの基礎')),

      //縦、横の二次元方向にwidgetを配置
      body: Column(
        children: [
          Text('プロフィール',style: TextStyle(fontSize: 36),),
          SizedBox(height:100),
          //子widgetが利用可能なスペースを埋めるように拡大する
          Expanded(
            child: GridView.builder(
              itemCount: 100, //要素数
              //このウィジェットのパラメータ
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, //横方向に配置する要素数
                mainAxisSpacing: 5, //縦方向の要素間のスペースを設定
                crossAxisSpacing: 5, //横方向の要素間のスペースを設定
                childAspectRatio: 0.9, //各要素の幅と高さの比率を設定
              ),

              //要素ごとの処理
              itemBuilder: (context, index) {
                return Image.network(
                  'https://picsum.photos/200?random = $index',
                  fit: BoxFit.cover,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
