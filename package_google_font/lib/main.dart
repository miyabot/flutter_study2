import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const Base());
}

class Base extends StatelessWidget {
  const Base({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //全体テーマの設定
      theme: ThemeData(
        textTheme: GoogleFonts.pottaOneTextTheme()
      ),

      home:FontSample()
    );
  }
}

class FontSample extends StatelessWidget {
  const FontSample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GoogleFontの確認'),
      ),
      body:Center(
        child:Column(
          children: [
            Text(
              'Fontの違いを確かめる',
              //GoogleFontsの適応
              // style:GoogleFonts.pottaOne(
              //   fontSize: 32, //文字の大きさ
              //   fontWeight: FontWeight.w700, //文字の太さ
              //   fontStyle: FontStyle.italic, //斜体に変更
              // )
            ),
            Text(
              'Fontの違いを確かめる',
              //GoogleFontsの適応
              // style:GoogleFonts.pottaOne(
              //   fontSize: 32, //文字の大きさ
              //   fontWeight: FontWeight.w700, //文字の太さ
              //   fontStyle: FontStyle.italic, //斜体に変更
              // )
            ),
            Text(
              'Fontの違いを確かめる',
              //GoogleFontsの適応
              // style:GoogleFonts.pottaOne(
              //   fontSize: 32, //文字の大きさ
              //   fontWeight: FontWeight.w700, //文字の太さ
              //   fontStyle: FontStyle.italic, //斜体に変更
              // )
            ),
          ],
        )
      )
    );
  }
}