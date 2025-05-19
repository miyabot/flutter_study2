import 'package:flutter/material.dart';

void main() {
  runApp(const Base());
}

//更新不要なクラス
class Base extends StatelessWidget {
  const Base({super.key});

  //処理を書く場所
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home:ListSample()
    );
  }
}

//更新可能なクラス
class ListSample extends StatefulWidget {
  const ListSample({super.key});

  @override
  State<ListSample> createState() => _ListSampleState();
}

//処理は二個目に生成されるクラスに書く
class _ListSampleState extends State<ListSample> {
  //変数、関数はここに書く
  List<String> list = ['りんご','ばなな','ぶどう'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Column:縦に並べる(スクロール不可)
      //ListView:縦に並べる(スクロール可)
      //Builder:可変式リスト
      body:ListView.builder(
        itemCount: 3,//要素数
        //要素ごとの処理
        //index:現在の要素番号
        itemBuilder: (context,index){
          return Text(list[index]);
        }
      )
    );
  }
} 




