import 'package:flutter/material.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  //TextFieldを監視
  TextEditingController con1 = TextEditingController();
  TextEditingController con2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('用語追加画面'),),
      body:Column(
        children: [
          TextField(
            controller: con1,
            decoration: InputDecoration(
              hintText: '用語'
            ),
          ),
          TextField(
            controller: con2,
            decoration: InputDecoration(
              hintText: '説明'
            ),
          ),
          ElevatedButton(
            onPressed: (){
              //debugPrint('用語：${con1.text}\n説明：${con2.text}');
              Navigator.pop(context,{
                'term':con1.text,
                'value':con2.text
              });
            }, 
            child: Text('追加')
          )
        ],
      )
    );
  }
}