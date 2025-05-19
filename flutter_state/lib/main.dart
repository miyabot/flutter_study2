import 'package:flutter/material.dart';

void main() {
  runApp(const Base());
}

//StatelessWidget:状態(State)を持たない
//使用例：画面の更新が不要な場合に使用
class Base extends StatelessWidget {
  const Base({super.key});

  //build内に処理を書く
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:HomePage()
    );
  }
}

//StatefulWidget:状態(State)を持つ
//使用例：画面の更新が必要な時に使用
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  //変数や関数の定義
  int cnt = 0;

  //build内に処理を書く
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //$:変数の中身を取り出す
            Text('$cnt',style:TextStyle(fontSize:36)), 

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  //押した時に呼ばれる
                  onPressed: (){
                    //setState:画面を更新を行う
                    setState(() {
                      cnt++;
                    });
                  }, 
                  child: Icon(Icons.add)
                ),
                ElevatedButton(
                  //押した時に呼ばれる
                  onPressed: (){
                    //setState:画面を更新を行う
                    setState(() {
                      cnt--;
                    });
                  }, 
                  child: Icon(Icons.remove)
                ),
                ElevatedButton(
                  //押した時に呼ばれる
                  onPressed: (){
                    //setState:画面を更新を行う
                    setState(() {
                      cnt*=2;
                    });
                  }, 
                  child: Text('×'),
                ),
                ElevatedButton(
                  //押した時に呼ばれる
                  onPressed: (){
                    //setState:画面を更新を行う
                    setState(() {
                      //~:(整数以下切り捨て)
                      cnt~/=2;
                    });
                  }, 
                  child: Text('÷')
                ),
              ],
            )
          ],
        )
      ),
    );
  }
}
