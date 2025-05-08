import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home:Scaffold(
        body:Center(
          //childは１つのwidgetしか指定できない
          //Column:縦に複数のwidgetを並べる
          //Row:横に複数のwidgetを並べる
          child:Column(
            //中央に寄せる
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    color: Colors.red,
                    width:100,
                    height:100
                  ),
                  Container(
                    color: Colors.green,
                    width:100,
                    height:100
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    color: Colors.blue,
                    width:100,
                    height:100
                  ),
                  Container(
                    color: Colors.yellow,
                    width:100,
                    height:100
                  ),
                ],
              ),
            ],
          ),
        )
      )
    )
  );
}

