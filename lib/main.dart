import 'package:flutter/material.dart';
import 'package:supplement_memo/db/database.dart';
import 'package:supplement_memo/screens/home_screen.dart';

late MyDatabase database;

void main() {
  database = MyDatabase();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "サプメモ",
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: HomeScreen(),
    );
  }
}
