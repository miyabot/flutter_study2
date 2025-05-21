import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('画面１',style: TextStyle(fontSize: 64),),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          //画面遷移
          Navigator.push(
            context, //現在地 
            MaterialPageRoute(builder: (context)=>const MyHomePage2(title: '遷移後のページ'))//遷移先の指定
          );
        },
        tooltip: '次のページ',
        child: const Icon(Icons.arrow_right_alt)
      ), 
    );
  }
}


class MyHomePage2 extends StatefulWidget {
  const MyHomePage2({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage2> createState() => _MyHomePageState2();
}

class _MyHomePageState2 extends State<MyHomePage2> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('画面２',style: TextStyle(fontSize: 64),),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          //前の画面に戻る
          //Navigator.pop(context);
        },
        tooltip: '前のページ',
        child: const Icon(Icons.turn_left)
      ), 
    );
  }
}

