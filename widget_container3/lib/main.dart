import 'package:flutter/material.dart';

void main() {

  //指定した色のコンテナを作成する関数
  Widget generateContainer(Color col){
    return Container(
      color: col,
      width: 100,
      height: 100,
    );
  }

  runApp(
    MaterialApp(
      home:Scaffold(
        body:Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              generateContainer(Colors.red),
              generateContainer(Colors.blue),
              generateContainer(Colors.yellow),
              generateContainer(Colors.green),
            ],
          ),
        )
      )
    )  
  );
}