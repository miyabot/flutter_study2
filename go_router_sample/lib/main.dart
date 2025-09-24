import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const Base());
}

//ログイン中かどうか
bool isLogin = false;

//画面遷移の一元管理
final GoRouter _router = GoRouter(
  routes: [
    //画面遷移の設定
    GoRoute(
      path: '/', //　'/'：ホームパス(最初に表示したい画面)
      builder: (context,state)=>const LoginPage() //遷移先
    ),
    GoRoute(
      path: '/mypage', 
      builder: (context,state)=>const MyPage() //遷移先
    ),
    GoRoute(
      path: '/loginreq', 
      builder: (context,state)=>const LoginReq() //遷移先
    ),

    //リダイレクト用の設定(条件によってルートの分岐が可能)
    GoRoute(
      path: '/redirect-login',
      redirect: (context,state){
        if(isLogin){
          //ログイン成功
          return '/mypage';
        }
        else{
          //ログイン失敗
          return '/loginreq';
        }
      }
    )

  ]
);

class Base extends StatelessWidget {
  const Base({super.key});

  @override
  Widget build(BuildContext context) {
    //GoRouterを使う際の書き方
    return MaterialApp.router(
      routerConfig: _router,
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

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
                context.push('/redirect-login');
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