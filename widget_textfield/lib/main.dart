import 'package:flutter/material.dart';

void main() {
  runApp(const Base());
}

class Base extends StatelessWidget {
  const Base({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
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

  //パスワード作成
  final String _pass = 'abc123';

  //TextField内の情報を管理するための変数
  TextEditingController _controller = TextEditingController();

  //エラーメッセージフラグ
  bool errorFlg = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('パスワード入力画面'),
      ),
      body: Center(
        //入力可能なフィールド
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 300,
              child: TextField(
                //監視役の設定
                controller: _controller,

                //見た目の装飾
                decoration: InputDecoration(
                  labelText: 'パスワードを入力してください。',
                  //三項演算子：(条件式) ? 真 ： 偽
                  errorText: (errorFlg == true) ? 'パスワードが間違えています。' : null,
                  border: OutlineInputBorder() //外枠追加
                ),
              ),
            ),

            ElevatedButton(
              onPressed: (){
                if(_pass == _controller.text){
                  debugPrint('ログイン成功');
                }
                else{
                  debugPrint('ログイン失敗');
                  setState(() {
                    errorFlg = true;  
                  });
                }
              }, 
              child: Text('送信')
            )
          ],
        ),
      ),
    );
  }
}