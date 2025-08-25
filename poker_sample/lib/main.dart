import 'package:flutter/material.dart';

void main() {
  runApp(const Base());
}

class Base extends StatelessWidget {
  const Base({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      //最初に呼び出す画面
      home: PokerPage(),
    );
  }
}

//stateful：更新可能なWidget
class PokerPage extends StatefulWidget {
  const PokerPage({super.key});

  @override
  State<PokerPage> createState() => _PokerPageState();
}

class _PokerPageState extends State<PokerPage> {

  //トランプの数字
  List<String> _numbers = ['A','2','3','4','5','6','7','8','9','10','J','Q','K'];

  //トランプのマーク
  List<String> _suits = ['♠','♥','♦','♣'];

  //山札の構築を行う関数


  @override
  Widget build(BuildContext context) {
    //下地の作成
    return Scaffold(
      //画面上部の作成
      appBar: AppBar(
        title:Text('PokerSample')
      ),
      body:Center(
        child: Text('５枚の手札'),
      )
    );
  }
}

