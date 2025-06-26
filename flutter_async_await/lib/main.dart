import 'package:flutter/material.dart';

void main() {
  runApp(const Base());
}

//StatelessWidget:画面の更新が不要な時に使用
class Base extends StatelessWidget {
  const Base({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: HomePage());
  }
}

//StatefulWidget:画面の更新が必要な時に使用
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //画面に表示するメッセージ
  String _message = '3秒待ってね';

  //３秒待機する関数(非同期処理)

  //Future:未来に処理が完了するというキーワード
  //async:「この関数は非同期で処理する」という宣言
  //await:処理が終わるまで待機
  Future<void> _delayedTask() async {
    //３秒待機する
    await Future.delayed(const Duration(seconds: 3));

    //setState:画面の更新をかける
    setState(() {
      _message = '完了しました';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          //中央に寄せる
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Text(_message, style: TextStyle(fontSize: 36)),
            //ElevatedButton:影付きボタン(外枠あり)
            ElevatedButton(
              //押された時に呼ばれる処理
              onPressed: _delayedTask,
              //ボタンの子要素
              child: Text('3秒待つ'),
            ),
          ],
        ),
      ),
    );
  }
}
