import 'package:flutter/material.dart';
import 'package:fluttertest/widgets/scaffold_main.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Pretendard',
      ),
      home: ScaffoldMain(
        body: Container(
          child: Text('asd'),
        ),
      ),
    );
  }
}
