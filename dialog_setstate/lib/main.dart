import 'package:flutter/material.dart';

void main() {
  runApp(const Base());
}

class Base extends StatelessWidget {
  const Base({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: DialogPage());
  }
}

class DialogPage extends StatefulWidget {
  const DialogPage({super.key});

  @override
  State<DialogPage> createState() => _DialogPageState();
}

class _DialogPageState extends State<DialogPage> {
  int cnt = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            //ダイアログ
            showDialog(
              context: context,
              builder: (context) {
                //ダイアログ内で更新をかける場合
                return StatefulBuilder(
                  builder: (context, setStateDialog) {
                    return AlertDialog(
                      content: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('$cnt', style: TextStyle(fontSize: 36)),
                            ElevatedButton(
                              onPressed: () {
                                //builderで決めた名前を使う
                                setStateDialog(() {
                                  cnt++;
                                });
                                debugPrint('$cnt');
                              },
                              child: Text('+1', style: TextStyle(fontSize: 36)),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            );
          },
          child: Text('開く'),
        ),
      ),
    );
  }
}
