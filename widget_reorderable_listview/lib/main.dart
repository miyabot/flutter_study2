import 'package:flutter/material.dart';

void main() {
  runApp(Base());
}

class Base extends StatelessWidget {
  const Base({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home:ReorderableSample()
    );
  }
}

class ReorderableSample extends StatefulWidget {
  const ReorderableSample({super.key});

  @override
  State<ReorderableSample> createState() => _ReorderableSampleState();
}

class _ReorderableSampleState extends State<ReorderableSample> {

  //変数名の頭に「_」をつけるとprivate
  //外部からのアクセスが出来なくなる
  List<String> _list = ['勉強','買い物','遊ぶ'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:ReorderableListView.builder(
        itemCount: _list.length, //要素数
        //要素ごとの処理内容
        itemBuilder: (context,index){
          return ListTile(
            //情報を保持するためキー
            key:Key('$index'),
            title: Text(_list[index]),
          );
        }, 

        //並び替えた時に呼ばれる
        //oldIndex:並び替え前の位置情報
        //newIndex:並び替え後の位置情報
        onReorder: (int oldIndex,int newIndex){
          setState(() {
            if(oldIndex < newIndex){
              newIndex--;
            } 
            final String item = _list.removeAt(oldIndex); 
            _list.insert(newIndex, item);
          });
        }
      )
    );
  }
}