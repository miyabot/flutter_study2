import 'package:flutter/material.dart';

void main() {
  runApp(const Base());
}

class Base extends StatelessWidget {
  const Base({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      //最初に呼び出す画面
      home: PokerPage(),
    );
  }
}

//stateful：更新可能なWidget
class PokerPage extends StatefulWidget {
  const PokerPage({super.key});

  @override
  State<PokerPage> createState() => _PokerPageState();
}

class _PokerPageState extends State<PokerPage> {
  //トランプの数字
  final List<String> _numbers = [
    'A',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    'J',
    'Q',
    'K',
  ];

  //トランプのマーク
  final List<String> _suits = ['♠', '♥', '♦', '♣'];

  //山札
  final List<Map<String, String>> _deck = [];

  //手札
  final List<Map<String, String>> _hand = [];

  //山札の構築を行う関数
  void _buildDeck() {

    //山札のリセット(配列の中身を空にする)
    _deck.clear();

    //山札への追加
    for (int i = 0; i < _suits.length; i++) {
      for (int j = 0; j < _numbers.length; j++) {
        _deck.add({'number': _numbers[j], 'suit': _suits[i]});
      }
    }

    //山札のシャッフル
    _deck.shuffle();

    debugPrint('山札の内容：$_deck');
  }

  //カードを引くための関数
  void _draw() {

    //手札のリセット(配列の中身を空にする)
    _hand.clear();

    for (int i = 0; i < 5; i++) {
      _hand.add(_deck[i]);
    }
    debugPrint('現在の手札：$_hand');
  }

  Color _suitColor(String suit){
    //♥と♦は赤、それ以外は黒
    return (suit == '♥'||suit == '♦') ? Colors.red:Colors.black;
  }

  //初期化関数(クラス生成時、最初に呼ばれる)
  @override
  void initState() {
    super.initState();

    //山札作成
    _buildDeck();

    //カードを５枚引く
    _draw();
  }

  @override
  Widget build(BuildContext context) {
    //下地の作成
    return Scaffold(
      //画面上部の作成
      appBar: AppBar(title: Text('PokerSample')),
      //中央に寄せる
      body: Center(
        //横に並べる
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              //中央に寄せる
              mainAxisAlignment: MainAxisAlignment.center,

              //Widget間のスペースを作成
              spacing: 12,

              //map:要素を一つずつ取り出して繰り返す(iterable)
              children:
                  _hand.map((card) {
                    //コンテナの作成
                    return Container(
                      color: Colors.white,
                      width: 70,
                      height: 100,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(card['number']!, style: TextStyle(fontSize: 24,color: _suitColor(card['suit']!))),
                          Text(card['suit']!, style: TextStyle(fontSize: 24,color: _suitColor(card['suit']!))),
                        ],
                      ),
                    );
                  }).toList(), //Iterable → Listに変換
            ),
            SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {
                //画面の更新
                setState(() {
                  //山札作成
                  _buildDeck();
                  //カードを５枚引く
                  _draw();
                });
              },
              child: Text('再配布'),
            ),
          ],
        ),
      ),
    );
  }
}
