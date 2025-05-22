import 'package:flutter/material.dart';

void main() {
  runApp(Base());
}

//stateless:更新不要なwidget
class Base extends StatelessWidget {
  const Base({super.key});

  //処理はbuildの中
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false, //デバッグ表記OFF
      home:ListSample2()
    );
  }
}

//stateful:更新可能なwidget
class ListSample2 extends StatefulWidget {
  const ListSample2({super.key});

  @override
  State<ListSample2> createState() => _ListSample2State();
}

class _ListSample2State extends State<ListSample2> {

  //変数や関数の定義場所
  List<String> list = ['りんご','ぶどう','いちご'];

  //追加関数
  void addList(String str){
    list.add(str);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //ListView.builder:可変式リスト
      body: ListView.builder(
        itemCount: list.length,//要素数
        //要素ごとの処理
        itemBuilder: (context,index){
          return Text('List：${list[index]}',style: TextStyle(fontSize: 36),);
        }
      ),
      //画面右下に表示されるボタン
      floatingActionButton: FloatingActionButton(
        //ボタンを押した時に呼ばれる
        onPressed: (){
          //画面の更新をかける
          setState(() {
            addList('さくらんぼ');
          });  
          debugPrint('listの中：$list');
        },
        child: Icon(Icons.add), //＋のアイコン
      ),
    );
  }
}