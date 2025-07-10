import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  
  //受け取るための変数
  final String term;
  final String value;

  //コンストラクタ(引数の設定)
  const DetailPage({super.key,required this.term,required this.value});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('$termの説明'),),
      body:Center(
        child: Text(value,style:TextStyle(fontSize: 28)),
      )
    );
  }
}