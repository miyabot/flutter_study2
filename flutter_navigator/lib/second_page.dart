import 'package:flutter/material.dart';

// class SecondPage extends StatelessWidget {

//   //コンストラクタ(クラスが生成されるタイミングで呼ばれる)
//   const SecondPage({super.key,required this.str});//引数の設定

//   //受け取り用
//   final String str;
  

//   @override
//   Widget build(BuildContext context) {
//     //下地の作成
//     return Scaffold(
//       //中央に寄せる
//       body:Center(
//         //縦に複数要素並べる
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(str,style: TextStyle(fontSize: 36),),

//             //サイズの情報を持った透明の箱
//             SizedBox(height: 16),
          
//             ElevatedButton(
//               //ボタンを押した時に呼ばれる
//               onPressed: (){
//                 //前の画面に戻る
//                 Navigator.pop(context);
//               }, 
//               //ボタンの中に表示する要素
//               child: Text('前のページ')
//             )
//           ],
//         ),
//       )
//     );
//   }
// }

class SecondPage extends StatefulWidget {

  //コンストラクタ(クラスが生成されるタイミングで呼ばれる)
  const SecondPage({super.key,required this.newCnt});//引数の設定

  //受け取り用
  final int newCnt;

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    //下地の作成
    return Scaffold(
      //中央に寄せる
      body:Center(
        //縦に複数要素並べる
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('${widget.newCnt}',style: TextStyle(fontSize: 36),),

            //サイズの情報を持った透明の箱
            SizedBox(height: 16),
          
            ElevatedButton(
              //ボタンを押した時に呼ばれる
              onPressed: (){
                //前の画面に戻る
                Navigator.pop(context);
              }, 
              //ボタンの中に表示する要素
              child: Text('前のページ')
            )
          ],
        ),
      )
    );
  }
}



