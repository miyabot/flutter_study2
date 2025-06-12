import 'package:flutter/material.dart';
import 'package:todo_app/add_page.dart';

void main() {
  runApp(Base());
}

class Base extends StatelessWidget {
  const Base({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home:TodoPage()
    );
  }
}

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {

  final List<String> _list = ['買い物','勉強','あそび'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //builder:可変式リストビュー
      body:ListView.builder(
        itemCount: _list.length, //要素数
        //要素ごとの処理
        itemBuilder: (context,index){
          return ListTile(
            leading: Icon(Icons.star_border), //左端
            title: Text(_list[index]), //メインコンテンツ
            //右端
            trailing: IconButton(
              onPressed: (){
                setState(() {
                  //指定した場所のリストを削除
                  _list.removeAt(index);
                });
              }, 
              icon: Icon(Icons.delete)
            ) 
          );
        }
      ),
      floatingActionButton: FloatingActionButton(

        //async,await：非同期処理
        onPressed: () async {
          //返ってきた内容を格納する変数
          String result;

          //popで持って帰ってきた内容をresultに代入
          result = await Navigator.push(
            context, 
            MaterialPageRoute(builder: (context)=>AddPage())
          );
          debugPrint('持って帰ってきた値：$result');

          //リストの追加
          setState(() {
            _list.add(result);  
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}



