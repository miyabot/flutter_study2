import 'package:flutter/material.dart';

void main() {
  runApp(const Base());
}

class Base extends StatelessWidget {
  const Base({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home:DialogPage()
    );
  }
}

class DialogPage extends StatefulWidget {
  const DialogPage({super.key});

  @override
  State<DialogPage> createState() => _DialogPageState();
}

class _DialogPageState extends State<DialogPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ダイアログの基礎'),
      ),
      //画面中央にボタンを表示
      body:Center(
        child:ElevatedButton(
          onPressed: (){
            //ダイアログの表示
            showDialog(
              context: context, 
              builder: (context){
                //表示内容
                return AlertDialog(
                    title: Center(
                      child: Text('アカウント削除',style:TextStyle(fontWeight:FontWeight.bold))
                    ),

                ); 
              }
            );
          }, 
          child: Text('ダイアログの表示')
        )
      )
    );
  }
}