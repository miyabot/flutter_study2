import 'package:dictionary_app/add_page.dart';
import 'package:dictionary_app/detail_page.dart';
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

  //用語をまとめた変数
  final Map<String,String> _dictionary = {
    'Flutter':'Google製のUI開発フレームワーク',
    'Dart':'Flutterで使われるプログラミング言語',
    'Widget':'UIの構成要素(パーツ)',
    'State':'画面の状態を管理する仕組み'
  };

  //クラス生成時に呼ばれる
  @override
  void initState() {
    super.initState();
    //debugPrint('確認用：${_dictionary['Flutter']}');
  }

  @override
  Widget build(BuildContext context) {

    //MapからListに変換して代入
    final entries = _dictionary.entries.toList();
    debugPrint('entries:$entries');

    return Scaffold(
      appBar: AppBar(title: Text('かんたん用語辞典'),),
      body:ListView.builder(
        itemCount: _dictionary.length, //４
        itemBuilder: (context,index){ //０～３
          return ListTile(
            title:Text(entries[index].key),
            //押された時に呼ばれる
            onTap: (){
              //画面遷移
              Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: (context)=>DetailPage(
                    term: entries[index].key,value: entries[index].value,
                  )
                )
              );  
            },
          );
        }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()async{
         final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context)=>AddPage()) 
          );
          debugPrint('result:$result');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}