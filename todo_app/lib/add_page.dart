import 'package:flutter/material.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {

  //textField内の監視
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center( 
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 300,
              //入力可能なフィールド
              child: TextField(
                controller: _controller,
                //見た目の装飾
                decoration: InputDecoration(
                  border: OutlineInputBorder() //外枠
                ),
              ),
            ),
            SizedBox(height:16),
            ElevatedButton(
              onPressed:(){
                //TextFieldの中身が空の時
                if(_controller.text.isEmpty) return; //早期リターン
                
                //debugPrint(_controller.text);
                //前のページに値を持って帰る
                Navigator.pop(context,_controller.text);
              }, 
              child:Text('追加')
            )
          ],
        ),
      ),
    );
  }
}