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

    //タイマースタート
    _stopwatch.start();

    //１秒ごとに画面を更新
    Timer.periodic(
      Duration(milliseconds:30 ), //実行間隔(30ミリ秒ごと) 
      //１秒ごとにどのような処理をするか
      (Timer timer){
        setState(() {});
      }
    );

  }

  //表示用の時間(分:秒.ミリ秒)をフォーマット
  String _formatTime(){
      return '1:13.123';
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child:Text('${_stopwatch.elapsed.inMinutes}:${_stopwatch.elapsed.inSeconds}.${_stopwatch.elapsed.inMilliseconds}',style: TextStyle(fontSize: 36),)
      )
    );
  }
}
