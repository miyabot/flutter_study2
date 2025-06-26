import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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

  //選択中の日付を管理
  DateTime _selectDay = DateTime.now();

  //フォーカスがあてられている日付を管理
  DateTime _focusDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //カレンダーの表示
      body: TableCalendar(
        firstDay: DateTime.utc(2025, 1, 1), //カレンダーの最初を指定
        lastDay: DateTime.utc(2025, 12, 31), //カレンダーの最後を指定
        focusedDay: DateTime.now(), //フォーカス(強調表示)する日を指定

        //日付を選択した時に呼ばれる処理
        onDaySelected: (DateTime selectedDay, DateTime focusedDay){
          //selected:選択された日付が入っている
          //focusd:フォーカスを当てる日付が入っている
          setState(() {
            _selectDay = selectedDay;
            _focusDay = focusedDay;
            debugPrint('選択された日：$_selectDay');
             debugPrint('フォーカスされた日：$_focusDay');
          });

        },
      ),


    );
  }
}
