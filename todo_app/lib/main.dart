import 'package:flutter/material.dart';

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
            title: Text(_list[index]),
          );
        }
      )
    );
  }
}



