import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const Base());
}

class Base extends StatelessWidget {
  const Base({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: HomePage());
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

  //保存されたリスト
  List<String> _saveList = [];

  //保存されたマップ
  Map<DateTime,String> _saveMap = {};

  //初期化関数
  @override
  void initState() {
    super.initState();

    //SharedPreferencesの中身をロード
    _loadSaveData();
    _loadSaveDataList();
    _loadSaveDataMap();
  }

  //保存されているテキストを読み込む処理
  Future<void> _loadSaveData() async {
    //SharedPreferencesを使うためのコード
    final prefs = await SharedPreferences.getInstance();

    //アプリ起動時に保存されているデータを読み込む
    setState(() {
      //データがなければ空文字 '' を使う
      _saveText = prefs.getString('save_text') ?? '';
    });
  }

  //保存されているテキストを読み込む処理
  Future<void> _loadSaveDataList() async {
    //SharedPreferencesを使うためのコード
    final prefs = await SharedPreferences.getInstance();

    //アプリ起動時に保存されているデータを読み込む
    setState(() {
      //データがなければ空文字 '' を使う
      _saveList = prefs.getStringList('save_list') ?? [];
    });
  }

  //保存されているMapを読み込む処理
  Future<void>_loadSaveDataMap()async{
    //SharedPreferencesを使うためのコード
    final prefs = await SharedPreferences.getInstance();

    //JSON文字列を取り出す。データがなければ空のJSON文字列を返す
    final jsonString = prefs.getString('save_map') ?? '{}';

    //JSON文字列をMap<String,dynamic>に変換
    final decodedMap = json.decode(jsonString) as Map<String,dynamic>; 

    //Map<String,dynamic>をMap<DateTime,String>に変換
    final Map<DateTime,String> tempMap = {};
    decodedMap.forEach((key,value){
      //JSONで保存されたStringキーをDateTimeに戻す
      if(value is String){
        tempMap[DateTime.parse(key)] = value;
      }
    });

    setState(() {
      _saveMap =tempMap;
    });
  }

  //入力したテキストを保存する関数(非同期)
  Future<void> _saveData() async {
    //SharedPreferencesを使うためのコード
    final prefs = await SharedPreferences.getInstance();

    //TextFieldに入力した文字列を「save_text」というKeyで保存
    await prefs.setString('save_text', _con.text);

    setState(() {
      //入力内容の保存
      _saveText = _con.text;
    });
  }

  //List<String>
  Future<void> _saveDataList() async {
    //SharedPreferencesを使うためのコード
    final prefs = await SharedPreferences.getInstance();

    //入力内容をリストに追加
    setState(() {
      _saveList.add(_con.text);  
    });

    //TextFieldに入力した文字列を「save_text」というKeyで保存
    await prefs.setStringList('save_list', _saveList);
  }

  //Map<DateTime,String>
  Future<void> _saveDataMap() async{
    //SharedPreferencesを使うためのコード
    final prefs = await SharedPreferences.getInstance();

    //現在の入力内容と時刻をMapに追加
    setState(() {
      _saveMap[DateTime.now()] = _con.text;
    });
    //中身の確認
    debugPrint('$_saveMap');

    //Map<DateTime,String>をMap<String,dynamic>に変換
    final Map<String,dynamic> strKeyMap = {};

    //_saveMapの各要素を取り出す
    _saveMap.forEach((key,value){
      //「DateTime型」を「JSONが理解できるString型」に変換
      strKeyMap[key.toIso8601String()]=value;
    });

    //Map型をJSON文字列に変換
    final jsonString = json.encode(strKeyMap);

    //JSON文字列をSharedPreferenceに保存
    await prefs.setString('save_map', jsonString);

    //保存後に入力欄をクリア
    _con.clear();

  } 

  //保存されているテキストを削除する関数
  Future<void> _clearData() async {
    //SharedPreferencesを使うためのコード
    final prefs = await SharedPreferences.getInstance();

    //指定したkeyのデータを削除
    await prefs.remove('save_text');

    setState(() {
      //入力内容の削除
      _con.clear();
      //保存されている内容の削除
      _saveText = '';
    });
  }

  //保存されているテキストを削除する関数
  Future<void> _clearDataList() async {
    //SharedPreferencesを使うためのコード
    final prefs = await SharedPreferences.getInstance();

    //指定したkeyのデータを削除
    await prefs.remove('save_list');

    setState(() {
      //入力内容の削除
      _con.clear();
      //保存されている内容の削除
      _saveList = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('保存の仕組み')),
      body: Column(
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
                onPressed: () {
                  //ローカルに保存
                  _saveData();
                },
                child: Text('保存'),
              ),
              SizedBox(width: 16),
              // ElevatedButton(
              //   onPressed: () {
              //     _saveDataList();
              //   },
              //   child: Text('リスト保存'),
              // ),
              // SizedBox(width: 16),
              ElevatedButton(
                onPressed: () {
                  _saveDataMap();
                },
                child: Text('マップ保存'),
              ),
              SizedBox(width: 16),
              ElevatedButton(
                onPressed: () {
                  _clearData();
                  _clearDataList();
                },
                child: Text('削除')
              ),
            ],
          ),
          SizedBox(height: 32),
          Text('保存されているテキスト(String)'),
          Text(_saveText),
          SizedBox(height: 32),
          Text('保存されているテキスト(List<String>)'),
          Text(_saveList.join(','),style: TextStyle(fontSize: 36),),
          SizedBox(height: 32),
          Text('保存されているテキスト(Map<DataTime,String>)'),
          //_saveMapの各要素を取り出してそれぞれのkeyとvalueを表示
          Text(_saveMap.entries.map((e)=>'${e.key} : ${e.value}').join('\n'))
        ],
      ),
    );
  }
}
