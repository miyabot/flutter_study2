import 'package:flutter/material.dart';
import 'package:widget_bottomnav/account.dart';
import 'package:widget_bottomnav/calendar.dart';
import 'package:widget_bottomnav/home.dart';
import 'package:widget_bottomnav/setting.dart';



void main() {
  runApp(const Base());
}

class Base extends StatelessWidget {
  const Base({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home:FirstPage()
    );
  }
}

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {

  //選択中のアイコン管理変数
  int _currentIndex = 0;

  //表示するページ管理変数
  //リストはファイナルで宣言
  final List<Widget> _page = [
    HomePage(),
    CalendarPage(),
    SettingPage(),
    AccountPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:_page[_currentIndex],

      //画面下部に表示するバー
      bottomNavigationBar: BottomNavigationBar(

        //４つ以上並べる場合(デフォルト３つまで)
        type:BottomNavigationBarType.fixed,

        //現在選択されているアイコンの指定
        currentIndex: _currentIndex,

        //タップされた時に呼ばれる
        onTap:(int selectIndex){
          
          setState(() {
            //selectIndex:選択されたアイコンのインデックス番号
            //_currentIndex:現在のインデックス番号
            _currentIndex = selectIndex;
          });

        },

        //見た目の装飾
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home),label:'home'),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_month),label: 'calendar'),
          BottomNavigationBarItem(icon: Icon(Icons.settings),label: 'setting'),
          BottomNavigationBarItem(icon: Icon(Icons.person),label: 'account'),
        ]
      ),
    );
  }
}

