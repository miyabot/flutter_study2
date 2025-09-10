import 'package:flutter/material.dart';

void main() {
  runApp(const Base());
}

class Base extends StatelessWidget {
  const Base({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home:LoginPage()
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  //ログイン中かどうか
  bool isLogin = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('ログインページ')
      ),
      body:Center(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //トグルスイッチ
            Switch(
              value: isLogin, //スイッチの状態 

              //スイッチの状態が変わった時に呼ばれる
              onChanged: (bool newValue){
                setState(() {
                  //newValue:切り替えた時のスイッチの状態
                  //isLogin:現在のスイッチの状態
                  isLogin = newValue;
                });
              }
            ),

            ElevatedButton(
              onPressed: (){
                //ログイン状態をチェック
                if(isLogin){
                  //ログイン成功
                  Navigator.push(
                    context, 
                    MaterialPageRoute(builder: (context)=>const MyPage())
                  );
                }
                else{
                  //ログイン失敗
                  Navigator.push(
                    context, 
                    MaterialPageRoute(builder: (context)=>const LoginReq())
                  );
                }
              }, 
              child: Text('ログイン')
            ),
          ],
        )
      )
    );
  }
}


//ログイン成功時に表示される画面
class MyPage extends StatelessWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('マイページ')
      ),
    );
  }
}
//ログイン失敗時に表示される画面
class LoginReq extends StatelessWidget {
  const LoginReq({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('ログイン失敗')
      ),
    );
  }
}