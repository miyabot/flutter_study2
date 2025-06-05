import 'package:flutter/material.dart';
import 'package:widget_drawer/tile1.dart';
import 'package:widget_drawer/tile2.dart';
import 'package:widget_drawer/tile3.dart';


void main() {
  runApp(const Base());
}

class Base extends StatelessWidget {
  const Base({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home:HomePage()
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //ドロワーはAppbarが無いと使えない
      appBar: AppBar(
        title: Text('Drawerの基礎'),
      ),
      //サイドメニュー
      drawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(
              //padding:余白の設定
              padding: EdgeInsets.zero,//余白なし
              child: Container(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('リストタイル１'),
              onTap: (){
                Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context) => Tile1())
                );
              },
            ),
            ListTile(
              title: Text('リストタイル２'),
              onTap: (){
                Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context) => Tile2())
                );
              },
            ),
            ListTile(
              title: Text('リストタイル３'),
              onTap: (){
                Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context) => Tile3())
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

