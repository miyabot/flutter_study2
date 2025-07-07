import 'package:flutter/material.dart';

void main() {
  runApp(const Base());
}

class Base extends StatelessWidget {
  const Base({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home:HomePage()
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  //List<型名> 変数名 = [初期値１,初期値２];
  final List<String> _list = ['ゴミ出し','勉強','朝食'];

  //Map<キーの型,バリューの型> 変数名 = {'キー１':'バリュー１','キー２':'バリュー２'};
  //キーとバリュー(値)のペアで管理するデータ
  final Map<String,String> _map = {'apple':'リンゴ','dog':'イヌ'};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text('ListとMapの違い')),
      body:ListView.builder(
        itemCount: _map.length, //要素数
        //要素ごとの処理
        itemBuilder: (context,index){
          final entry = _map.entries.toList()[index];
          debugPrint('entryの中身：$entry');
          //map型はキーを指定してバリュー(値)を取り出す
          return Text('${entry.key}:${entry.value}',style: TextStyle(fontSize: 36),);
        }
      )
    );
  }
}

