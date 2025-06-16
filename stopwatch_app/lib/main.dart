import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(const Base());
}

class Base extends StatelessWidget {
  const Base({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home:StopWatchSample()
    );
  }
}

class StopWatchSample extends StatefulWidget {
  const StopWatchSample({super.key});

  @override
  State<StopWatchSample> createState() => _StopWatchSampleState();
}

class _StopWatchSampleState extends State<StopWatchSample> {

  //ストップウォッチ用
  //late:初期化を後回しにする
  late Stopwatch _stopwatch;

  //最初に実行される関数
  @override
  void initState() {
    super.initState();

    //ストップウォッチの初期化
    _stopwatch = Stopwatch();

    //30ミリ秒ごとに画面を更新
    Timer.periodic(
      Duration(milliseconds:30 ), //実行間隔(30ミリ秒ごと) 
      //30ミリ秒ごとにどのような処理をするか
      (Timer timer){
        setState(() {});
      }
    );

  }

  //表示用の時間(分:秒.ミリ秒)をフォーマット
  String _formatTime(){
      final _elepsed = _stopwatch.elapsed; //経過時間の取得

      //padLeft(2,'0')：文字列の長さが2になるように、足りない分を左側に'0'で埋める
      String minutes = (_elepsed.inMinutes % 60).toString().padLeft(2,'0'); //分数を文字列に変換して代入
      String seconds = (_elepsed.inSeconds % 60).toString().padLeft(2,'0');
      String milliSeconds = (_elepsed.inMilliseconds % 1000).toString().padLeft(3,'0');

      //分:秒.ミリ秒の形に直す
      return '$minutes:$seconds.$milliSeconds';
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_formatTime(),style: TextStyle(fontSize: 36),),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround, //均等に並べる
              children: [
                ElevatedButton(
                  onPressed: (){
                    //タイマースタート
                    _stopwatch.start();
                  }, 
                  child:Text('スタート')
                ),
                ElevatedButton(
                  onPressed: (){
                    //タイマーストップ
                    _stopwatch.stop();
                  }, 
                  child:Text('ストップ')
                ),
                ElevatedButton(
                  onPressed: (){
                    //タイマーリセット
                    _stopwatch.reset();
                  }, 
                  child:Text('リセット')
                ),
              ],
            )
          ],
        )
      )
    );
  }
}
