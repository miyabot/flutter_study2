import 'package:flutter/material.dart';

void main() {
  runApp(const Base());
}

class Base extends StatelessWidget {
  const Base({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  //変数宣言は初期値が無いとエラーが起きる
  //String str;

  //非NULL許容型(中身がNULLだとエラーが起きる)
  String str1 = '初期値';

  //NULL許容型(中身がNULLでもエラーが出ない)
  String? str2;
  String? str3 = '中身あり';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //縦に並べる
      body:Column(
        children: [
            Text(str1,style: TextStyle(fontSize: 28),),
            SizedBox(height: 12,),
            
            //変数 ?? 値 → 変数の中身がNULLだった場合、??の後ろを返す
            Text(str2 ?? 'NULL',style: TextStyle(fontSize: 28),),
            SizedBox(height: 12,),
            
            //変数！ → 変数の中に値が入っていることを明示している
            Text(str3!,style: TextStyle(fontSize: 28),),
        ],
      )
    );
  }
}



