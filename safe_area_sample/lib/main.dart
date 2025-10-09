import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //ページ切り替え用のWidget
      body: PageView(
        children: [
          //SafeAreaなし
          CustomPage(col: Colors.orange, str: 'なし'),
          //SafeAreaあり
          SafeArea(
            child: CustomPage(col: Colors.blue, str: 'あり'),
          )
        ],
      ),
    );
  }
}

//共通化
class CustomPage extends StatelessWidget {

  final Color col;
  final String str;

  //引数の設定(コンストラクタ)
  const CustomPage({
    super.key,
    required this.col,
    required this.str
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: col.withAlpha(55),
      child: Column(
        children: [
          Container(
            height: 60.0,
            color: col,
            child: Center(child: Text('ヘッダー(SafeArea$str)')),
          ),
          //空き領域を埋める
          Expanded(child: Center(child: Text('コンテンツ(SafeArea$str)'))),
          Container(
            height: 60.0,
            color: col,
            child: Center(child: Text('フッター(SafeArea$str)')),
          ),
        ],
      ),
    );
  }
}
