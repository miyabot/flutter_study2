import 'package:flutter/material.dart';
import 'package:flutter_navigator2/second_page.dart';

void main() {
  runApp(const Base());
}

//基盤の作成
class Base extends StatelessWidget {
  const Base({super.key});

  //処理はbuildの中
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home:NavSample()
    );
  }
}

class NavSample extends StatefulWidget {
  const NavSample({super.key});

  @override
  State<NavSample> createState() => _NavSampleState();
}

class _NavSampleState extends State<NavSample> {
  @override
  Widget build(BuildContext context) {
    //下地の作成
    return Scaffold(
      //中央に寄せる
      body:Center(
        //縦に複数要素並べる
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('画面１',style: TextStyle(fontSize: 36),),

            //サイズの情報を持った透明の箱
            SizedBox(height: 16),
          
            ElevatedButton(
              //ボタンを押した時に呼ばれる
              onPressed: (){
                //画面遷移
                Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context)=>SecondPage())
                );
              }, 
              //ボタンの中に表示する要素
              child: Text('次のページ')
            )
          ],
        ),
      )
    );
  }
}

