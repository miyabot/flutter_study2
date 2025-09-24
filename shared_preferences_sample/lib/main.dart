import 'package:flutter/material.dart';

void main() {
  runApp(const Base());
}

class Base extends StatelessWidget {
  const Base({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
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

  //TextFieldの監視役(コントローラー)
  final TextEditingController _con = TextEditingController();

  //保存したテキストを表示するための変数
  String _saveText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('保存の仕組み'),
      ),
      body:Column(
        //左端
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: _con, //監視役の設定
          ),
          SizedBox(height: 16),
          Row(
            children: [
              ElevatedButton(
                onPressed: (){
                  setState(() {
                    //入力内容の保存
                    _saveText = _con.text;
                  });
                }, 
                child: Text('保存')
              ),
              SizedBox(width: 16),
              ElevatedButton(
                onPressed: (){
                  setState(() {
                    //入力内容の削除
                    _con.clear();

                    //保存されている内容の削除
                    _saveText = '';
                  });
                }, 
                child: Text('削除')
              ),
            ],
          ),
          SizedBox(height: 32),
          Text('保存されているテキスト'),
          Text(_saveText)
        ],
      )
    );
  }
}